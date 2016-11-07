class AddLocationToUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
     add_column :users, :location, :string
  end
end
