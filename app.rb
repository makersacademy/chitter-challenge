require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users' do
    @users = User.all
    erb :"users/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/users'
  end
end
