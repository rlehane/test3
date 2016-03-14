class Ability
  include CanCan::Ability

  def initialize(user)
  

    if user.has_role? :admin
      can :manage, :all  # can manage (Read, Create, Update, Destroy, ...) everything
    else 
        can :update, Job do |job|
         job.try(:user) == user
        end

        can :destroy, Job do |job|
         job.try(:user) == user
        end

        cannot :read, Note
      end
      
    if user.has_role? :charity

        can :create, Job 






    end

  end
end
