class AddNumberToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :number, :string
  end
end
