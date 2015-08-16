require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride

  register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  get '/user/new' do
    erb :'user/new'
  end
  post '/user' do
    user=User.new(name: params[:name],
                user_name: params[:user_name],
                email: params[:email],
                password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/user/new'
    end
  end

  get '/session/new' do
    erb :'session/new'
  end
  post '/session' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Wrong Password"
      redirect '/session/new'
    end
  end 
  delete '/session' do
    session[:user_id] = nil
    flash[:notice] = "Goodbye"
    redirect '/session/new'
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

end





