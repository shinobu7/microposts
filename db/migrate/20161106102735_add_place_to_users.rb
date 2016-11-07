class AddPlaceToUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    add_column :users, :place, :string
  end
end
