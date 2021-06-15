class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    entity = user.entity

    if user.is_a?(Manager)
      can :manage, Entity, id: user.entity_id
      can :manage, House, id: entity.houses
      can :read, Manager
    elsif user.is_a?(Staff)
      can :manage, House, id: entity.houses
      can :read, Staff
    elsif user.is_a?(Client)
      can :read, Client
    end
  end
end
