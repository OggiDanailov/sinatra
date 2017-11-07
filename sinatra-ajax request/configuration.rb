require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require './models'
require './app'

set :database, "sqlite3:books.sqlite3"
enable :sessions