ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
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

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'signup/new'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session['user_id'] = @user.id
      redirect '/weclome'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'signup/new'
    end
  end

  get '/welcome' do
    current_user
    p @user.username
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
