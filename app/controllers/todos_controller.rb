class TodosController < ApplicationController
  before_action :authenticate_user!, except: [:index]


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
end

