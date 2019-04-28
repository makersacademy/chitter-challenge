require 'sinatra/base'
require './lib/user'
require './db/database_connection_setup'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/peeps' do
    @user = User.find(session[:id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      message: params[:message],
      time: Time.now,
      user_id: session[:id]
    )
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    session[:id] = @user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
