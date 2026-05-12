class Public::CommentsController < ApplicationController
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
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    flash[:notice] = "削除しました"
    @comment.destroy
    redirect_to post_path(@post)
  end

   private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
