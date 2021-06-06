class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    entity = user.entity

    if user.is_a?(Manager)
      can :manage, Entity, id: user.entity_id
      can :manage, House, id: entity.houses
    elsif user.is_a?(Staff)
      can :manage, House, id: entity.houses
    elsif user.is_a?(Client)
    end
  end
end
