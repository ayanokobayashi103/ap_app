class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path, notice: '新規登録しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to reviews_path, notice: "編集しました"
  end

  def destroy
    @review.destroy
    redirect_to reviews_path, notice: "削除しました"
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
