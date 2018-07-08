require 'sinatra/base'
require 'sinatra/flash'
# require './lib/peep'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users/new' do
    User.add(params['username'], params['name'], params['email'], params['password'])
    redirect '/'
  end

  get '/users/login' do
    erb :log_in
  end

  post '/users' do
    user = User.authenticate(params['username'], params['password'])
    if user != nil
      session[:usename] = user[0]['username']
      session[:name] = user[0]['name']
      redirect '/'
    else
      flash[:notice] = 'Invalid username or password'
      redirect '/users/login'
    end
  end


  run! if app_file == $0
end
