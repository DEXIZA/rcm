class TodosController < ApplicationController
  def index
  end

  def new
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

