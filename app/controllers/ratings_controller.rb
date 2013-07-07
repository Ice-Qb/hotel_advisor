class RatingsController < ApplicationController
  before_filter :signed_in_user  

  def create
    @hotel = Hotel.find(cookies[:last_hotel_id])
  	@rating = @hotel.ratings.build(params[:rating])
    if @rating.save
      @hotel.star_rating = (@hotel.ratings.map(&:value).sum.to_f / @hotel.ratings.count).round(2)
      @hotel.save
      flash[:success] = "Your rating mark added!"
      redirect_to @hotel
    else
      flash[:error] = "Choose the rating mark!"
      redirect_to @hotel
    end
  end

  def destroy
  end

end