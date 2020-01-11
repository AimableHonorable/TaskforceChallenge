class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstName, :text
    add_column :users, :lastName, :text
    add_column :users, :phone, :string
  end
end
