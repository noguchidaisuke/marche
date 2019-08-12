class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :g_id
      t.string :name
      t.string :url
      t.string :pc
      t.string :shop_image1
      t.string :pr_short

      t.timestamps
    end
  end
end
