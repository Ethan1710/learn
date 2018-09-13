class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    redirect_to restaurant_path(Restaurant.find(params[:restaurant_id]))
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end



  def edit
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to restaurants_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:star, :description, :restaurant_id)
  end
end
