require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/peep' do
    Peep.create(content: params[:content], time: Time.now)
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
