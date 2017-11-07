class CreateBlogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :blogs do |t|
  		t.string :title
  		t.text :body
  		t.integer :user_id
  	end
  end
end
