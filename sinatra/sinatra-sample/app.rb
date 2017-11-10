require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

set :database, "sqlite3:books.sqlite3"
set :sessions, true

get '/' do
erb :index
end

get '/user/:id' do
@user1 = User.find(session[:user_id]).username
@user = User.find(session[:user_id])
		@blogs = @user.blogs
erb :user
end


post '/sign_up' do
User.create(username: params[:username], password: params[:password])
flash[:notice] = 'Yousigned up successfully'
redirect '/'
end

post '/sign_in' do
user = User.where(username: params[:username]).first
	if user && user.password = params[:password]
		session[:user_id] = user.id
		flash[:notice] = 'You signed in successfully'
	redirect "/user/#{user.id}"
	else
		flash[:notice] = 'Please try again'
		redirect '/sign_in'
	end
end

post '/sign_out' do
	session[:user_id] = nil
	redirect '/'
end

post '/blogs' do
	@user = User.find(session[:user_id])
	@blog = Blog.new
	@blog.title = params[:title]
	@blog.body = params[:body]
	@blog.user_id = @user.id
	if @blog.save
		redirect '/blogs'
	else
		redirect "/user/#{user.id}"
	end
end


get '/blogs' do
	@blogs = Blog.all
erb :blogs
end

get '/blog/:id' do	
	@blog = Blog.find(params[:id])
	erb :blog
end







