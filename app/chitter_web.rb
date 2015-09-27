require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  get '/' do
      redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                   name:       params[:name],
                   username:   params[:username],
                   password:   params[:password],
                   password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id]  = @user.id
      session[:username] = params[:username]
      session[:name]     = params[:name]
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ["Email or password incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:logged_out] = "Goodbye"
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content],
                username: session[:username],
                name: session[:name],
                time: Time.now
                )
    p params[:name]
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
