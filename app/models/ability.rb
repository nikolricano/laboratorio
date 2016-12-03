class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :read, :all
      can :create,      Results
      can :edit,        Results
      can :update,      Results
      can :destroy,     Results
      can [:set_title], Results
    elsif user.basic?
      can :read, :all
      can :create,      Results
    else
      can :read, :all
    end
  end
end
