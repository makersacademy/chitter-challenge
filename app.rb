require 'sinatra/base'
require_relative './lib/user.rb'

# checks which databse to run
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session[:user_id]
    erb :index
  end

  run! if app_file == $0

end
