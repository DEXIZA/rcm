class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
 
    if user.roll == 5
      can :read, :mng
    elsif user.roll == 1
      can :read, :ptn
    elsif user.roll == 2
      can :read, :ptnreader
    elsif user.roll == 3
      can :read, :employee
    elsif user.roll == 4
      can :read, :deputy
    end
  end
end