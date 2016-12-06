class Ability
  include CanCan::Ability

 def admin?
		Roles.find_by_name(‘Admin’)
	end
	def editor?
     Roles.find_by_name('editor')
	end
	def basic?
   Roles.find_by_name('basic')
  end

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
    elsif user.basic?
      can :read, :all
    else
      can :read, :all
    end


  end
end
