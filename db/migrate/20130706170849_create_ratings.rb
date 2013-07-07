class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :comment
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :hotel_id
  end
end
