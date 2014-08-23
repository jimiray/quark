class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    user ||= User.new # guest user (not logged in)
    # a signed-in user can do everything
    if user.has_role? :admin
     # an admin can do everything
      can :manage, :all
    elsif user.has_role? :edit
        can :manage, Article
    elsif user.has_role? :author
      # an editor can do everything to documents and reports
      can :index, [Article]
      can :create, [Article]
      can :update, [Article] do |article|
        article.try(:user) == user
      end
    end
  end
end