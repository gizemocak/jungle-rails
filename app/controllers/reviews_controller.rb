class ReviewsController < ApplicationController
  def create
    @review = Product.find(params[:product_id]).reviews.new(review_params)
    @review.user = current_user

    if @review.save
      # redirect_to "/products/#{params[:product_id]}"
      redirect_to product_path params[:product_id]
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description
    )
  end
end
