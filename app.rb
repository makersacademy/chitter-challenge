require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/peep.rb'
require 'time'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    erb(:homepage)
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.verify(email: params[:email], password: params[:password])
    if user
      session[:userid] = user.id
      session[:name] = user.name
      redirect '/peeps/index'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  get '/peeps/index' do
    @name = session[:name]
    @userid = session[:userid]
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peep/new' do
    @userid = session[:userid]
    @name = session[:name]

    Peep.create(userid: @userid, timestamp: Time.now, \
      content: params[:peep_content], threadpeep: params[:peep_content])

    redirect '/peeps/index'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.register(name: params[:name], user_name: params[:user_name], \
      email: params[:email], password: params[:password])
    session[:userid] = user.id
    session[:name] = user.name
    redirect '/peeps/index'
  end

  run! if app_file == $0
end
