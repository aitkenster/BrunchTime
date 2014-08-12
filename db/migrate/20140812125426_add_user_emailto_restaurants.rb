class AddUserEmailtoRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :user_email, :string
  end
end
