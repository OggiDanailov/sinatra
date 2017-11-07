require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:test.sqlite3"
set :sessions, true

get '/' do	
	
erb :index	
end

get '/login' do
erb :login
end

post '/login' do
	@user = User.find(session[:user_id])
	user = User.where(name: params[:username].first)
	if user.password == params[:password]
		session[:user_id] == user.id
		redirect '/'
	else
		redirect '/login'
	end
end

get '/users' do
@users = User.all
erb :users
end

get '/users/:id' do
@user = User.find(params[:id])
erb :user
end

post '/users' do
	@name = params['input_name']
	@email = params['input_email']
User.create(name: @name, email: @email)
redirect '/users'
end


get '/blogs' do
if params['search']
	@blogs = Blog.where(title: params['search'])
else
	@blogs = Blog.all
end
erb :blogs
end


post '/blogs' do
	@title = params['blog_title']
	@body = params['blog_title']
	Blog.create(title: @title, body: @body)
	redirect '/blogs'	
end






