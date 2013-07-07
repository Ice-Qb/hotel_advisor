class AddStarRatingToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :star_rating, :decimal, precision: 3, scale: 2, default: 1.00
  end
end
