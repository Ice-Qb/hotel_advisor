class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.boolean :breakfast, default: false
      t.text :description
      t.float :price
      t.integer :user_id

      t.timestamps
    end
    add_index :hotels, [:user_id, :created_at]
  end
end
