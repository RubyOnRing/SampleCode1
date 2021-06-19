class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    entity = user.entity

    case user
    when Manager
      can :manage, Entity, id: user.entity_id
      can :manage, House, id: entity.houses
      can :manage, Contract, id: entity.contracts
      can :read, Manager
    when Staff
      can :manage, House do |house|
        house.agent.in?(entity.agents)
      end
      can :read, Staff
      can :read, Contract, id: entity.contracts
    else
      # Client
      can :read, Client
    end
  end
end
