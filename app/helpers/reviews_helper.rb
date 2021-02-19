module ReviewsHelper
  def create_or_update
    if action_name == "create" || action_name == "new" 
      shop_reviews_path
    else action_name == "edit"
      shop_review_path
    end
  end
end
