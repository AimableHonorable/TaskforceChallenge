class RemoveAboutFromRestaurants < ActiveRecord::Migration[6.0]
  def change

    remove_column :restaurants, :about, :string
  end
end
