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

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @chits = Chit.all
    erb :'chits/index'
  end

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
      redirect '/welcome'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup/new'
    end
  end

  get '/welcome' do
    @user = current_user
    erb :'signup/welcome'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chits')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/chits'
  end

  get '/new' do
    @user = current_user
    if @user
      erb :'chits/new'
    else
      p @user
      redirect('/sessions/new')
    end
  end

  post '/new' do
    chit = Chit.create(user: current_user, post: params[:post], time: Time.now.strftime("%d/%m/%Y %H:%M"))
    params[:tags].split.each do |tag|
      chit.tags << Tag.create(name: params[:tags])
    end
    chit.save!
    redirect('/chits')
  end

  get '/search/:name' do
    tag = Tag.all(name: params[:name])
    @chits = tag ? tag.chits : []
    erb :'chits/index'
  end


end
