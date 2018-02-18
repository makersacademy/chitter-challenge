require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/peep'
require_relative 'lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions

  get '/' do
    redirect '/peeps/'
  end

  get '/peeps/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps' do
    Peep.create(params['new_peep'])
    redirect '/peeps/new'
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb(:sessions_new)
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])

    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Incorrect info - please try again.'
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0

end
