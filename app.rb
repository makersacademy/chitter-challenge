require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do 
    Peep.create(message: params['peep'], user_id: session[:user_id])
    redirect '/peeps'
  end 

  get '/users/new' do 
    erb :"users/new"
  end

  post '/users/new' do 
    user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end 

  get '/login' do 
    erb :'login/index'
  end 

  post '/login' do 
    user_id = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user_id
    redirect '/peeps'
  end 

  run! if app_file == $0

end 
