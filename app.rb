require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    @user = User.find(session[:user_id])
    erb :index
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/new_peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    user = User.create(name: params[:name], handle: params[:handle],
      email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run if app_file == $0

end
