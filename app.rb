require "sinatra/base"
require "./lib/bottle"
require "./lib/user"
require_relative "database_connection_setup"

class Shore < Sinatra::Base
  enable :method_override, :sessions

  before do
    @user = User.current_user
  end

  get '/' do
    @bottles = Bottle.all
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/bottle' do
    erb :bottle
  end

  post '/' do
    User.create(params[:username], params[:name], params[:email], params[:password])
    redirect '/'
  end

  post '/bottle' do
    Bottle.post(@user.username, params[:body])
    redirect '/'
  end

  run! if app_file == $0
end
