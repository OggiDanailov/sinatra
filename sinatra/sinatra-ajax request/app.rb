
before do
@current_user = User.find(session[:user_id]) if 
session[:user_id]
	end

get '/' do 
erb :index
end


get '/sign-up' do
erb :sign_up
end	

post '/sign-up' do
	@username = params[:username]
	@email = params[:email]
	@password = params[:password]
	User.create(username: @username, email: @email, password: @password)
redirect '/'
end	

get '/sign-in' do
erb :sign_in
end

get '/users/:id' do
	@user = User.find(params[:id])
	erb :user
end

get '/users'  do
@users = User.all
erb :users
end

post '/sessions/new' do
@user = User.where(email: params[:email]).first
	if @user.email && @user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/search'
	else 
		redirect '/sign-in'
	end
end

post "/signout" do
	session.clear
	redirect "/"
end

get '/search' do
	
erb :search
end














