ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'



class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:'links/index')
  end

  get '/posts' do
    @posts = Post.all
    erb(:'links/posts')
  end

  post '/sign_in' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      #flash welcome back message
      session[:user_id] = @user.id
      redirect '/posts'
    else
      #error message
      redirect '/'
    end
  end

  get '/register' do
    @user = User.new
    erb(:'links/register')
  end

  post '/welcome' do
    @user = User.new(username: params[:username],
                     name: params[:name],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      #flash.next welcome message
      redirect '/posts'
    else
      #flash.now password error
      #flash.now email error
      erb(:'links/register')
    end
  end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  run! if app_file == $PROGRAM_NAME

end
