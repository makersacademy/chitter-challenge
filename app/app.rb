ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'



class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:'links/index')
  end

  get '/posts' do
    @posts = Post.all
    erb(:'links/posts')
  end

  post '/new_post' do
    time = Time.new.strftime("%H:%M")
    Post.create(body: params[:chit],
                username: User.get(session[:user_id]).name,
                time: "#{time}")
    redirect '/posts'
  end

  post '/sign_in' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      flash.next[:welcome] = "Welcome back, #{@user.name}"
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
      flash.next[:welcome] = "Welcome to Chitter, #{@user.name}"
      redirect '/posts'
    else
      #flash.now password error
      #flash.now email error
      erb(:'links/register')
    end
  end

  post '/log_out' do
      session.clear
      #flash goodbye message
      redirect '/'
    end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  run! if app_file == $PROGRAM_NAME

end
