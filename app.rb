require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'
require_relative 'lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

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
    redirect '/peeps/'
  end

  run! if app_file == $0

end
