require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class PeepManager < Sinatra::Base
  enable :sessions

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
end
