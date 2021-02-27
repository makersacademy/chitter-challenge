require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/database_connection'
require_relative 'lib/user'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      name:     params[:name],
      email:    params[:email],
      username: params[:username],
      password: params[:password])

    session[:user_id] = user.id
  end

  get '/peeps' do
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:peep], user_id: session[:user_id])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
