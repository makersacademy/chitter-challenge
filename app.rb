require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/peep'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:id])
    @timeline = Peep.sort_peeps
    erb :index
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
      if User.username_exists?(params[:username]) || User.username_exists?(params[:email])
        flash[:notice] = 'User already exists!'
      else
        user = User.create(params[:name], params[:username], params[:email], params[:password])
        session[:id] = user.id
      end
    redirect '/'
  end

  post '/peep' do
    Peep.create(params[:content], session[:id])
    redirect '/'
  end

  run! if app_file == $0
end
