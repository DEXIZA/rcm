class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  before_action :search_todo, only: [:index, :searchh]



  def index
    @todos = Todo.includes(:user).order('created_at DESC')
    set_todo_column       # privateメソッド内で定義
    @roll1 = Todo.where(roll_id: 1 ).includes(:user).order('created_at DESC')
    @roll2 = Todo.where(roll_id: 1..2 ).includes(:user).order('created_at DESC')
    @roll3 = Todo.where(roll_id: 1..3 ).includes(:user).order('created_at DESC')
    @roll4 = Todo.where(roll_id: 1..4 ).includes(:user).order('created_at DESC')
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
    @comment = Comment.new
    @comments = @todo.comments.includes(:user)
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

  def search
    @todos = Todo.search(params[:keyword])
  end

  def searchh
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
  end

  def mytodo
    @mytodo = Todo.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  private

  def todo_params
    params.require(:todo).permit(
      :title,
      :content,
      :urgency_id,
      :roll_id,
      :image,
      :category_id,
      :start,
      :end
    )
          .merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @todo.user_id
  end

  def search_todo
    @p = Todo.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_todo_column
    @todo_title = Todo.select("title").distinct  # 重複なくnameカラムのデータを取り出す
  end

end

