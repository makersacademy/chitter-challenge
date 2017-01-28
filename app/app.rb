ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

  get '/' do
    redirect '/main'
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up_form
  end

  post '/sign_up' do
    @user = User.create( name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up_form
    end
  end

  get '/main' do
    @username = current_user.username if current_user
    erb :main
  end

end
