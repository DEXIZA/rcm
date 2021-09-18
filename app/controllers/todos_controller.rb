class TodosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_todo, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]




  def index
    @todos = Todo.order('created_at DESC')
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo.id)
    else
      render :edit
    end
    # 更新成功→詳細画面偏移　更新失敗→編集画面偏移の処理
  end



  def destroy
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(
      :title,
      :content,
      :urgency_id,
      :who_id,
      :image
    )
          .merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @todo.user_id
  end

end

