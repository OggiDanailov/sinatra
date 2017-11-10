require 'sinatra'
require 'sendgrid-ruby'
require 'sinatra/activerecord'
require './models'
include SendGrid

set :database, "sqlite3:test.sqlite3"


get '/' do
	@user = User.find(1)
	erb :home
end

get '/users' do
@users = User.all
erb :users
end

post '/search' do
@name = User.where(params[:name])

redirect '/'
end

get 'users/:id' do
@user = User.find(params['id'])
erb :user
end

get '/posts' do
@user = User.find(1)
@posts = Post.where(user_id: 1)
erb :posts
end



get '/html' do

	erb :html
end

get '/javascript' do
	erb :javascript
end


get '/ruby' do
	erb :ruby
end

get '/sinatra' do
	erb :sinatra
end

get '/rails' do
	erb :rails
end

get '/contact' do
	erb :contact
end

post '/thanks' do
	p params
from = Email.new(email: params['inputEmail'])
subject = params['inputSubject']
to = Email.new(email: 'ogidan@abv.bg')
content = Content.new(type: 'text/plain', value: params['inputText'])
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)

	erb :thanks
end

get '/thanks' do
	erb :thanks
end

