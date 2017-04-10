ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    unless current_user
      redirect '/sessions/new'
    else
      erb :'peeps/new'
    end
  end

  post '/peeps' do
    timenow = (Time.now).strftime("%H:%M - %m/%d/%Y")
    peep = Peep.create(message: params[:message], name: current_user.name, username: current_user.username, timeposted: timenow)
    hashtags = params[:hashtags].gsub(/\s/,'').split(',')
    hashtags.each do |hashtag|
      peep.hashtags << Hashtag.first_or_create(name: hashtag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/hashtags/:name' do
    hashtag = Hashtag.first(name: params[:name])
    @peeps = hashtag ? hashtag.peeps : []
    erb :'/peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/peeps'
  end
end
