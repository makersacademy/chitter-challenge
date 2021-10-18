require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require_relative 'database_connection_setup'
require './lib/user'

class Chitter_Messages < Sinatra::Base  
  enable :sessions, :method_override 
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    erb :index
  end 

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :'peeps/index'
  end 

  post '/peeps' do
    
    Peep.create(content: params[:new_peep])
    redirect '/peeps'
  end 

  get '/peeps/new' do 
    erb :'peeps/new'
  end 

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end
  
  #start the server if ruby file executed directly
  run! if app_file == $0
end