require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all

    erb :index
  end

  post '/chitter/sign-in' do
    @user = User.find_by(username: params[:username], password: params[:password])
    session[:user_id] = @user['id'].to_i

    redirect '/chitter/userpage'
  end

  get '/chitter/userpage' do
    @peeps = Peep.all
  
    erb :userpage
  end

  post '/chitter/userpage' do
    @peeps = Peep.all
    Peep.create(message: params[:peep], user_id: session[:user_id])
  
    redirect '/chitter/userpage'
  end

  get '/signup' do
    erb :sign_up
  end

  post '/signup' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])

    redirect '/chitter/userpage'
  end
  
  run! if app_file == $0
end
