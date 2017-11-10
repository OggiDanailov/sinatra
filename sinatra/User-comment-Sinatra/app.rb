require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

set :database, "sqlite3:whatever.sqlite3"
enable :sessions

get '/' do 
erb :index
end


get "/sign_up" do
erb :sign_up
end

get '/sign_in' do	
erb :sign_in
end


post '/users' do
@name = params[:name]
@username = params[:username]
@password = params[:password]
User.create(name: @name, username: @username, password: @password)
redirect "/users"
end

get '/users'  do
@users = User.all
erb :users
end

post '/sessions/new' do
@user = User.where(username: params[:username]).first
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		flash[:notice] = "You've successfully signed in"

		redirect '/posts'
	else
 	flash[:notice] = "Please try again"
	redirect '/sign_in'
	end
end


get '/users/:id' do
@user = User.find(params[:id])
erb :user
end


get '/posts' do
	@posts = Post.all
	erb :posts
end


post '/posts' do
	
	user = User.find(session[:user_id])
	Post.create(title params[:title], body: params[:body], user_id: user.id)
	redirect '/'

end


get '/posts/:id' do
@post = Post.find(params[:id])
erb :post
end


post "/signout" do
	session.clear
	flash[:notice] = "You've successfully signed out"
	redirect "/"
end

get '/user_edit' do
erb :user_edit
end


post '/user_edit' do
	user = User.find(session[:user_id])
	user.update(name: params[:name], username: params[:username], password: params[:password])
	flash[:notice] = "You have successfully updated your profile"
	redirect '/'
end


post '/destroy_user' do
	user = User.find(session[:user_id])
	user.destroy
	flash[:notice] = "You've successfully deleted your account"
	redirect '/'
end











