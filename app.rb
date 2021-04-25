require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'
require './lib/peep'
require './lib/users'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.list
    @user_name = session[:user_name]
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/post_peep' do
    Peep.create(text: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = Users.create(email: params[:email], password: params[:password], name: params[:name])
    session[:user_name] = user.name
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
