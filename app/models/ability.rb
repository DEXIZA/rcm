class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
 
    if user.roll == 2
      can :manage, :all
    elsif user.roll == 1
      can :read, :hello
    end
  end
end