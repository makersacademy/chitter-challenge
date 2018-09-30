require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/database_connection'
require_relative 'lib/peeps'
require_relative 'lib/users'


if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_database_test')
else
  DatabaseConnection.setup('chitter_database')
end

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all
    p "******", @peeps
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  get '/users/login' do
    erb :"users/login"
  end

  post '/users/login' do
    user = Users.authenticate(params['email'], params['password'])
    if user.is_a? String
      flash[:err_message] = user
      redirect '/users/login'
    else
      session[:user] = user
      redirect '/users/welcome'
    end
  end

  get '/users/signup' do
    erb :"users/signup"
  end

  get '/users/welcome' do
    @user = session[:user]
    erb :"users/welcome"
  end

  post '/users/signup' do
    user = Users.create(params['email'], params['password'])
    if user == false
      flash[:err_message] = 'Email address is already taken.'
      redirect 'users/signup'
    else
      session[:user] = user
      redirect '/users/welcome'
    end
  end

  post '/users/logout' do
    session.clear
    flash[:message] = 'You have logged out'
    redirect '/peeps'
   end

  post '/peeps/new' do
    Peeps.create(params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
