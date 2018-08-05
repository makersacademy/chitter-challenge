require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  post '/new' do
    Peep.create(params)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(username: params['username'], name: params['name'],
                email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  run! if app_file == $PROGRAM_NAME

end
