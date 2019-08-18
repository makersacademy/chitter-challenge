require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class ChitterWeb < Sinatra::Base
  database_connection_setup
  enable :sessions, :method_override

  get '/' do
    "Hello, world!"
  end 

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
