ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

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

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions/new' do
    email = params[:email]
    password = params[:password]
    if user = User.authenticate(email: email, password: password)
      session[:user_id] = user.id
      redirect to '/peeps/index'
    else
      flash.next[:notice] = "Invalid email or password"
      redirect to '/sessions/new'
    end
  end

  get '/users/new' do
    erb(:'users/new')
  end

  get '/peeps/index' do
    @username = current_user.username
    erb(:'/peeps/index')
  end

  post '/users/new' do
    user = User.new(email: params[:email],
                    name: params[:name],
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps/index'
    else
      error_str = ''
      user.errors.each_value do |error|
        error_str << "#{error.first}"
      end
      flash.next[:notice] = error_str
      redirect to '/users/new'
    end
  end

end
