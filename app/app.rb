require 'sinatra/base'
require './lib/peeps.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps/index' do
    @user = User.find(id: session[:user_id]) 
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps/index'
  end

  run! if app_file == $0
end