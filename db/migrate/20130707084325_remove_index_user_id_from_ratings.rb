class RemoveIndexUserIdFromRatings < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.remove_index column: :user_id
    end
    remove_column :ratings, :user_id
  end
end
