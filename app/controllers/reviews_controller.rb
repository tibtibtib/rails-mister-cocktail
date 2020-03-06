class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.cocktail = @cocktail
    @dose = Dose.new

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
