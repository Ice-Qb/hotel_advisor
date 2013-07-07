class ChangeCountryToCountryName < ActiveRecord::Migration
  def change
  	rename_column :addresses, :country, :nation
  end
end
