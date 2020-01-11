class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :resto_name
      t.string :location
      t.string :about

      t.timestamps
    end
  end
end
