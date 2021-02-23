class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.shop_id = params[:shop_id]
    if @review.save
      redirect_to shop_reviews_path, notice: 'クチコミ投稿しました！'
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:shop_id])
  end

  def edit
    @review.shop_id = params[:shop_id]
  end
  
  def update
    if @review.update(review_params)
      redirect_to shop_reviews_path, notice: "クチコミを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @review.destroy
    redirect_to shop_reviews_path, notice: "クチコミを削除しました！"
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
