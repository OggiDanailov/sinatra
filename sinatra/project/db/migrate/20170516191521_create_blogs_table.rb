class CreateBlogsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :blogs do |b|
  		b.string :title
  		b.text :content
  	end
  end
end
