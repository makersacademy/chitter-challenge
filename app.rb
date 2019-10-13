require 'sinatra/base'

require './lib/peep'
require './lib/user'

require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:id] = user.id
    redirect '/peeps'
  end

  get '/users/sign_in' do
    "Coming soon"
  end

  get '/peeps' do
    p @user = User.find(session[:id])
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb:'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
