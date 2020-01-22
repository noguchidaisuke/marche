class AddToPrLongToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :pr_long, :text
  end
end
