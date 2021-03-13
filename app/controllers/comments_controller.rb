class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @shop = @review.shop
    @comment = @review.comments.build(comment_params)
    respond_to do |format|
    if @comment.save
      format.js {render 'index'}
    else
      format.html {redirect_to review_path(@review, shop_id: @shop), notice: '投稿できませんでした'}
    end
  end
  end

  private
  def comment_params
    params.require(:comment).permit(:review_id,:content)
  end
end
