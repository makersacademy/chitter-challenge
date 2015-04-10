require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/Chitter_#{env}")

require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    'Hello, Chitter'
  end

  get '/users/new' do
    "<form action='/users' method='post'>
      Email:<input type='text' name='email'>
      Name:<input type='text' name='name'>
      User Name:<input type='text' name='user_name'>
      Password:<input type='password' name='password'>
      Confirm Password:<input type='password' name='password_confirmation'>
      <input type='submit' value='Sign Up'>
    </form>"
  end

  post '/users' do
    user_name = params['user_name']
    User.create(email: params['email'],
                name: params['name'],
                user_name: params['user_name'])
    "Welcome, #{user_name}!"
  end

  run! if app_file == Chitter

end