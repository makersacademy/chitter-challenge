require 'sinatra/base'
require_relative './lib/user.rb'
require_relative './lib/peep.rb'

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
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    @users = User.all
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      text: params[:message],
      user_id: session[:user_id],
    )
    redirect '/peeps'
  end

  run! if app_file == $0

end
