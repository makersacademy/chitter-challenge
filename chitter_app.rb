require 'sinatra/base'
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

  get '/users/signup' do
    erb :"users/signup"
  end

  get '/users/welcome' do
    @user = session[:user]
    erb :"users/welcome"
  end

  post '/users/signup' do
    session[:user] = Users.create(params['email'], params['password'])
    redirect '/users/welcome'
  end

  post '/peeps/new' do
    Peeps.create(params['peep'])
    redirect 'peeps'
  end

  run! if app_file == $0
end
