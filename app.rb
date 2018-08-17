require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'

set :database, "sqlite3:project-name.sqlite3"



require './models'
