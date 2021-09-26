class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
 
    if user.roll == 5
      can :read, :mng
    elsif user.roll == 1
      can :read, :ptn
    elsif user.roll == 2
      can :read, :ptnreader #Ptn主任
    elsif user.roll == 3
      can :read, :employee #社員
    elsif user.roll == 4
      can :read, :deputy #副店長
    elsif user.roll == 6
      can :manage,:all #admin
    end
  end
end