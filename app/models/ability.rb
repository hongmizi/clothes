class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    end

    can :manage, Design do |design|
      design.user == user
    end

    can :manage, Product do
      user.has_role? :admin 
    end
  end
end
