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

  get '/' do
    redirect '/peeps/feed'
  end

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users/sign_up' do
    @user = User.create(username: params[:username],
                email: params[:email],
                name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation]
               )
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps/feed'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/sign_up'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps/feed')
    else
      flash.now[:errors] = ["The username or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "So long, farewell, auf wiedersehen, adieu!"
    redirect to '/peeps/feed'
  end

  get '/peeps/feed' do
    @peeps = Peep.all
    erb :'peeps/feed'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:peep],
                username: current_user.username,
                name: current_user.name,
                created_at: Time.now
    )
    redirect to '/peeps/feed'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
