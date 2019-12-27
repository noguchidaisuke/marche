class AddTelToRestaurant < ActiveRecord::Migration[5.2]
  def down
    change_column :restaurants, :tel, :integer
  end
  def up
    change_column :restaurants, :tel, :string
  end
end
