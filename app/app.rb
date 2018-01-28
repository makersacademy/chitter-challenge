ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/models/database_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/signup' do
    erb :signup
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.next[:login_error] = 'Email or password was incorrect'
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/peeps'
  end

  post '/user/new' do
    if User.first(params[:email]) || User.first(params[:username])
      flash.next[:taken] = 'This email or username is already in use'
      redirect '/signup'
    end

    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       name: params[:name],
                       username: params[:username])
    if user.id.nil?
      flash.next[:signup_error] = 'Password and confirmation password do not match'
      redirect '/signup'
    else
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(order: :created_at.desc)
    erb :peeps
  end

  get '/peeps/new' do
    redirect '/login' unless current_user
    erb :new_peep
  end

  post '/peeps/sending_peep' do
    Peep.create(message: params[:peep], user_id: current_user.id)
    redirect '/peeps'
  end
end
