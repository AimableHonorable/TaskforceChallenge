class AddRestaurantToBreakfasts < ActiveRecord::Migration[6.0]
  def change
    add_reference :breakfasts, :restaurant, null: false, foreign_key: true
  end
end
