require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/users' do
    erb :'new'
  end
  
  post '/users/new' do
    user = Chitter.setup(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/' do
    @user = Chitter.find_user(id: session[:user_id])
    @peeps = Chitter.all_peeps
    erb :'index'
  end

  post '/peep' do
    Chitter.create_peep(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end