require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

# Acts as the controller
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    erb :'peeps/index'
  end

  get '/users' do
    @user = User.retrieve(session[:user_id])
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params[:username],
                        params[:name],
                        params[:email],
                        params[:password])
    session[:user_id] = @user.id
    redirect '/users'
  end

  run! if app_file == $PROGRAM_NAME
end
