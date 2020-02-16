require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

class PeepManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :"/peeps/index"
  end

  post '/peeps' do
    @user = User.find(session[:user_id])
    Peep.create(content: params["content"], name: @user.name, username: @user.username)
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params['name'], username: params['username'], password: params['password'], email: params['email'])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id    
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password'
      redirect('/sessions/new')
    end
  end
end
