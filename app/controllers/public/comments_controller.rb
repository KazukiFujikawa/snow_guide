class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to post_path(@post)
    else
      flash[:alert] = "コメントに失敗しました"
      redirect_to post_path(@post)
    end
  end

  def destroy
    flash[:notice] = "削除しました"
    @comment.destroy
    redirect_to post_path(@post)
  end

   private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def correct_user
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to post_path(@post) unless @comment
  end
end
