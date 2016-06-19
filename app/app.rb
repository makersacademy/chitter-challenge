ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  set :session_secret, 'super secret'

  get '/' do
    erb(:'user/welcome')
  end

  get '/newuser' do
    @user = User.new
    erb(:'/user/new')
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password], username: params[:username])
    session[:user_id] = User.first.id
    redirect to('/peeps')
    # else
    # # #   flash.now[:errors] = @user.errors.full_messages
    # erb(:'/user/new')
  end

  get '/peeps' do
    erb(:'posts/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  run! if app_file == $0
end
