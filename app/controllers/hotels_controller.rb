class HotelsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :admin_user, only: [:edit, :update, :destroy]

  def index
  	@hotels = Hotel.order("created_at DESC").paginate(page: params[:page])
  end

  def show
  	@hotel   = Hotel.find(params[:id])
    @rating  = @hotel.ratings.build if signed_in?
    @ratings = @hotel.ratings.order("created_at DESC")
    cookies[:last_hotel_id] = @hotel.id
  end

  def new
  	@hotel = Hotel.new
  end

  def create
    @hotel = current_user.hotels.build(params[:hotel])
    if @hotel.save
      cookies[:new_hotel] = @hotel.id
      flash[:success] = "Step 1 of 2!"
      redirect_to new_address_url
    else
      render 'new'
    end
  end

  def edit
  	@hotel = Hotel.find(params[:id])
  end

  def update
  	if Hotel.find(params[:id]).update_attributes(params[:hotel])
      cookies[:edit_hotel] = @hotel.id
      flash[:success] = "Step 1 of 2!"
      redirect_to edit_address_path
    else
      render 'edit'
    end 
  end

  def destroy
    Hotel.find(params[:id]).destroy
    flash[:success] = "Hotel destroyed!"
    redirect_to root_url
  end

  def top
    @hotels = Hotel.order("star_rating DESC").limit(5)
  end

  def about    
  end

end
