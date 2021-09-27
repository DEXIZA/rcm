class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]


  def index
    @user = User.where(roll: 1..5 ).order(created_at: :desc)
    @retirement = User.where(roll: 6 ).order(updated_at: :desc)

  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to root_path  
    end
  end

end
private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.fetch(:user, {}).permit(:name,:roll,:password,:encrypted_password,:kana,:phone,:birthday,:email)
  end

  def move_to_index
    redirect_to action: :index unless current_user.roll == 5 || current_user.roll == 4 || current_user.roll == 10
  end