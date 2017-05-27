ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative '../data_mapper_setup'
require 'sinatra/flash'
require 'rack'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'my secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def user_params
      { email: params[:email],
      password: params[:password],
      name: params[:name], username: params[:username],
      password_confirmation: params[:password_confirmation] }
    end
  end

  get '/' do
    @posts = Post.all
    erb(:homepage)
  end

  get '/sign-up' do
    @user = User.new
    erb(:sign_up)
  end

  post '/sign-up' do
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:sign_up)
    end
  end

  delete '/user' do
    session[:user_id] = nil
    flash.keep[:notice] = 'See you soon!'
    redirect to '/'
  end

  get '/sign-in' do
    erb(:sign_in)
  end

  post '/sign-in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:sign_in)
    end
  end

  get '/post-peep' do
    erb(:post_peep)
  end

  post '/post-peep' do
    user = current_user
    if user
      Post.create(contents: params[:contents],
                         user_id: user.id,
                         timestamp: DateTime.now)
      redirect '/'
    else
      "You must be signed in to peep."
    end
  end

end
