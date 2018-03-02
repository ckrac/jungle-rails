class ReviewsController < ApplicationController
  # before_filter :require_login

  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]

    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to :back, notice: 'Review created'
    else
      redirect_to :back, notice: 'Review failed to create'
    end
  end

  def destroy
    @del_review = Review.find params[:id]
    @del_review.destroy
    redirect_to :back, notice: 'Review deleted'
  end

  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end
end


