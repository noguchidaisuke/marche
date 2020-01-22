class AddCategoryAndStationToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :category, :string
    add_column :restaurants, :station, :string
  end
end
