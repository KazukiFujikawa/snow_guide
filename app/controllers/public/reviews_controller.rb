class Public::ReviewsController < ApplicationController
before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    review = current_user.reviews.find_or_initialize_by(post: post)
    review.assign_attributes(review_params)
    review.save
    redirect_to post_path(post)
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :post_id)
  end
end