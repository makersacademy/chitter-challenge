require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
#require_relative './lib/database_connection.rb'

class Chitter < Sinatra::Application
  enable :sessions
  #register Sinatra::Flash
  before do
    @user = User.instance
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    #session[name] = params[:name]
  # create the user and then...
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = user.username
    redirect '/peeps/index'
  end

  get '/peeps/index' do
    @user = User.find(session[:username])
    p @user
    #@user = session[:username]
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps/index'
  end

  run! if app_file == $0

end
