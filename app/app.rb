ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/index')
  end

  get '/index' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    @user = User.new(username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      session[:user_id] = @user.id
      redirect '/index'
    else
      flash.now[:error] = 'Passwords don\'t match: please reenter your password'
      erb :signup
    end
  end

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
