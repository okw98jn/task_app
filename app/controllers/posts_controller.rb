class PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: "desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを投稿しました"
      redirect_to("/")
    else
      flash[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to("/")
    else
      flash[:alert] = "編集に失敗しました"
      render :edit, status: :unprocessable_entity

    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to("/")
  end
end

private

def post_params
  params.require(:post).permit(:title, :start_date, :end_date, :is_all_day, :memo_text)
end
