require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'


class Chitter < Sinatra::Base
  enable :sessions
  #register Sinatra::Flash
  get '/peeps' do
    "Welcome to Chitter"
  end
  get '/' do
    "Timeline"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
    end

  run! if app_file == $0
end
