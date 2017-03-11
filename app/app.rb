ENV["RACK_ENV"] ||= 'development'


require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'


class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get'/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      redirect '/'
    end
  end

# start the server if ruby file executed directly
run! if app_file == $0


end
