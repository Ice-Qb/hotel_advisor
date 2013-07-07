class AddressesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :admin_user, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    @hotel = Hotel.find(cookies[:new_hotel])
    @hotel.address = @address
    if @hotel.save
      flash[:success] = "Your hotel successfully created!"
      redirect_to hotels_url
    else
      render 'new'
    end
  end

  def edit
  	@address = Address.find_by_hotel_id(cookies[:edit_hotel])
  end

  def update
  	if Hotel.find(cookies[:edit_hotel]).address.update_attributes(params[:address])
      flash[:success] = "Hotel updated!"
      redirect_to hotels_url
    else
      render 'edit'
    end 
  end

  def destroy
  end

end
