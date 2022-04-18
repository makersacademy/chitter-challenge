require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative './models/peep'
require_relative './models/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/peeps'
    else
      redirect '/sessions/failure'
    end
  end

  get '/sessions/failure' do
    erb :'sessions/failure'
  end

  get '/sessions/destroy' do
    erb :'sessions/destroy'
  end

  post '/sessions/destroy' do
    session.clear
    redirect 'sessions/destroy'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      redirect '/sessions/new'
    else
      redirect '/sessions/failure'
    end
  end

  get '/peeps' do
    @users = User
    @username = User.find_by(id: session[:user_id]).username unless session[:user_id].nil?
    @peeps = Peep.order(created_at: :desc)
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(params)
    peep.user = User.find_by(id: session[:user_id])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
