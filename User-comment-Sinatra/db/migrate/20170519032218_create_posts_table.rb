class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |p|
  	p.string  :title
  	p.text  :body
  	p.integer  :user_id
  	end
  end
end
