require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'
enable :sessions

set :database, "sqlite3:project-name.sqlite3"

get '/' do
  erb :home
end


get '/login' do
  erb :login
end


post '/login' do
  email = params['email']
  given_password = params['password']
  user = User.find_by(email: email)
  #check to see if email exists
  #check to see if the email has a pw that equals the form pw
  #if they match login the user
  if user.password == given_password
    session[:user] = "#{email}"
    redirect :account
  else
    p "Invalid Credentials"
    redirect '/'
  end
end


get '/logout' do
  session[:user] = nil
  p "User has been logged out"

  redirect '/'
end


get '/account' do
  erb :account
end


get '/signup' do
  erb :signup
end


post '/signup' do
  p params
  user = User.new(
    email: params['email'],
    name: params['fullname'],
    password: params['password']
  )
  user.save
  redirect '/'
end


get '/home' do
  erb :home
end




require './models'
