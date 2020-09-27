require 'uri'

require 'sinatra/base'
require 'sinatra/flash'

require './lib/peep_service'
require './lib/user_service'
require './database_connection_setup'


class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = PeepService.all
    @user = UserService.current_user

    erb :index
  end

  post '/peeps' do
    PeepService.post(params[:peep_message], UserService.current_user.username)
    redirect '/'
  end

  get '/users/new' do
    erb :registration
  end

  post '/users/new' do
    UserService.register(params[:username], params[:name], params[:email], params[:password])
    redirect '/'
  end

  post '/login' do
    flash[:notice] = "Invalid credentials" unless UserService.login(params[:username], params[:password])
    redirect '/'
  end

  post '/logout' do
    UserService.logout
    redirect '/'
  end

  run! if app_file == $0
end