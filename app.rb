require 'sinatra/base'
require './lib/peep'
require './lib/setup_connect_database'
## require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    erb :index
    ## redirect '/peeps'
  end

  get '/peeps' do
    # @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  post '/new_peep' do
    Peep.create(params)
    redirect '/peeps'
  end

  # get '/users/new' do
  #   erb :"users/new"
  # end

  # post '/users' do
  #   user = User.create(username: params['username'], name: params['name'],
  #               email: params['email'], password: params['password'])
  #   session[:user_id] = user.id
  #   redirect '/peeps'
  # end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  # post '/sessions' do
  #   user = User.authenticate(params['email'], params['password'])
  #   session[:user_id] = user.id
  #   redirect('/peeps')
  # end

  ## get '/new_peep' do
  ##   erb :"new_peep"
  ## end

  ## post '/peeps' do
  ##   Peep.create(peep: params['peep'])
  ##   redirect '/peeps'
  ## end

  run! if app_file == Chitter
end
