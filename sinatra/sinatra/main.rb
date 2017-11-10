require 'sinatra'

get '/' do 


	@whatever =  [1,2,3,4,5,6,7,8,9]
	@names = ["Oggi", "Boro", "Spas", "Rad"]
	@status = ['idiot', 'more or less idiot', 'idiot', 'total idiot']


	erb :home
	
end


get '/search' do
	@search_term = params[:search]
	p params
erb :search
end


get '/login' do
	@username = params[:username] 
	@password = params[:password]
	
erb :login
end

get '/contact' do
erb :contact
end

post '/thanks' do
@name = params[:name]
@email = params[:email]
@text = params[:text]

erb :thanks
end


