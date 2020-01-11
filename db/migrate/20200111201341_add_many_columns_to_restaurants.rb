class AddManyColumnsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :website, :string
    add_column :restaurants, :online_delivery, :boolean, default: false
    add_column :restaurants, :table_booking, :boolean, default: false
  end
end
