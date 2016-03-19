class Ability

  include CanCan::Ability
  def initialize(user)
  can :access, :rails_admin   # grant access to rails_admin
  can :dashboard  
  can :manage, :all 

    if user && (user.has_role? :admin)
      can :manage, :all  # can manage (Read, Create, Update, Destroy, ...) everything
      can :access, :rails_admin
    else 
        can :update, Job do |job|
         job.try(:user) == user
        end

        can :destroy, Job do |job|
         job.try(:user) == user
        end
      can :access, :rails_admin
        cannot :read, Note
      end

    if user && (user.has_role? :charity)

        can :create, Job 






    end

  end
end
