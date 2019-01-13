require 'sinatra/base'
require './lib/user'
require './lib/peep'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(content: params[:peep])
    redirect '/profile'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/profile"
  end

  get '/profile' do
    @user = User.get(session[:user_id])
    @peep = Peep.all
    erb :profile
  end

  run! if app_file == $0
end
