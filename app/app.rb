ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
    register Sinatra::Flash

    set :session_secret, 'super secret'

    helpers do
     def user_name
      @user_name ||= User.get(session[:user_id])
     end
    end

    get '/users/new' do
      erb :'users/new'
    end

    post '/users' do
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect '/chat'
      else
        flash[:error] = user.errors.full_messages.join('. ')
        flash[:email] = params[:email]
        redirect '/users/new'
      end
    end

      get '/chat' do
        erb :'links/chat'
      end
      
  run! if app_file == $0
  end
