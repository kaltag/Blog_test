class PostAbility
  include CanCan::Ability
  def initialize(user)
    can :read, Post

    return unless user.present?

    can :manage, Post, user:
  end
end
