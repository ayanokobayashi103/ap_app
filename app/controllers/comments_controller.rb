class CommentsController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_review, only: %i[create edit update destroy]

  def create
    @shop = @review.shop
    @comment = @review.comments.build(comment_params)
    @comment.owner_id = current_owner.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.js { render :index }
      end
    end
  end

  def edit
    @comment = @review.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @review.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js { render :index }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:review_id, :content, :owner_id)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end
