class CommentsController < ApplicationController
before_action :registered_user?
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

  def destroy
    @comment = Comment.find(params[:comment_id])
    respond_to do |format|
      if @comment.destroy
        format.js { render :index }
      else
        format.html {redirect_to review_path(@review, shop_id: @shop), notice: '削除できませんでした'}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:review_id,:content)
  end
  def registered_user?
    authenticate_user! || authenticate_owner!
  end
end
