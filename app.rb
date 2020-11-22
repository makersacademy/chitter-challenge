require 'sinatra'
require_relative './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peep = Peep.all
    erb :index
  end

  get '/peeping' do
    erb :peeping
  end

  post '/peeping' do
    Peep.peep(peep: params[:peep])
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  get '/login/new' do
    erb :'login/new'
  end

  post '/login/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.find(id: session[:user_id])
    erb :welcome
  end

  run if app_file == $0
end
