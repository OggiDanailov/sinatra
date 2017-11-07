class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |u|
  		u.string :name
  		u.string :email		
  	end
  end
end
