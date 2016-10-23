require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/sign-up' do
    @user = User.new
    erb :sign_up
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  post '/users' do
    @user = User.create(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    name: params[:name],
    username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      @user.errors.each do |e|
        flash.now[:notice] = e
      end
      erb :sign_up
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

end
