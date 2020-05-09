require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  # Returns list of peeps
  get '/' do
    @user = session[:current_user]
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # Form to submit peep
  get '/peeps/new' do
    erb :'peeps/new'
  end

  # Submit peep
  post '/peeps' do
    @user = session[:current_user]
    Peep.create(user_id: @user.id, message: params[:peep])
    redirect '/'
  end

  # Form to create new user
  get '/users/new' do
    erb :'/users/new'
  end

 # Submit user
  post '/users' do
   User.create(name: params[:name], email: params[:email], password: params[:password])
   redirect '/users/login'
  end

  # Form to login
  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    @user = User.authenticate(email: params[:email], password: params[:password])
    # If user is authetnicated assign current_user to session else redirect to login page
    @user ? (session[:current_user] = @user) : (redirect '/users/login')
    redirect '/'
  end
end
