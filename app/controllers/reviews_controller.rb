class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
    @shop = Shop.find(params[:shop_id])
  end

  def new
    @review = Review.new
    @review.shop_id = params[:shop_id]
  end

  def create
      binding.irb
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.shop_id = params[:shop_id]
    if @review.save
      redirect_to shop_reviews_path, notice: '新規登録しました'
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
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
