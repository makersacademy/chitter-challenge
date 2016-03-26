ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chit'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  enable :sessions
  set :session_secret, 'super secret'

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/users/new' do
    erb :'signup/new'
  end

  post '/signup' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/welcome')
  end

  get '/welcome' do
    current_user
    erb :'signup/welcome'
  end

  get '/new' do
    erb :'chits/new'
  end

  post '/new' do
    chit = Chit.create(post: params[:post], time: Time.now.strftime("%d/%m/%Y %H:%M"))
    params[:tags].split.each do |tag|
      chit.tags << Tag.create(name: params[:tags])
    end
    chit.save
    redirect('/chits')
  end

  get '/search/:name' do
    tag = Tag.all(name: params[:name])
    @chits = tag ? tag.chits : []
    erb :'chits/index'
  end


end
