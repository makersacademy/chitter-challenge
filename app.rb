require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    register Sinatra::Flash
  end

  get '/' do
    'Chitter Homepage'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/register' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user] = user
    flash[:success] = "Welcome, #{user.name}"
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end