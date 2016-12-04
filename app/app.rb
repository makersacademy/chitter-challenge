ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require "./app/models/user"
require "./app/models/peep"
require "./app/models/comment"
require "./app/models/mailgun"
require_relative "datamapper_setup"
require 'sinatra/flash'
require "dotenv"
Dotenv.load

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb(:sign_up)
  end

  post '/users' do
      @user = User.new(email: params[:email], name: params[:name], user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        log_in(@user)
      else
        flash.now[:notice] = @user.errors.full_messages
        erb(:sign_up)
      end
  end

  patch '/users' do
    user = User.first(password_token: session[:token])
    if user
      user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:password_token] = nil
      user.update(password_token: nil)
      flash.keep[:notice] = ["Password has been updated"]
      log_in(user)
    else
      flash.now[:notice] = ["Token is invalid"]
      redirect to('/users/reset-password')
    end
  end

  get '/users/reset-password' do
    erb(:reset_password)
  end

  post '/users/reset-password' do
    user = User.first(email: params[:email])
      if user
        user.generate_token
        mailer = MailGun.new
        mailer.send_token(user)
        flash.now[:notice] = ["An email with a confirmation token has ben sent to your inbox"]
        erb(:reset_password)
      else
        flash.now[:notice] = ["The user doesn't exist"]
        erb(:reset_password)
      end
  end

  get '/users/recover' do
    if !params[:token].nil?
      if user = User.first(password_token: params[:token])
        session[:token] = params[:token]
        erb(:recover)
      else
        flash.keep[:notice] = ["Invalid token"]
        redirect to('/users/reset-password')
      end
    else
      flash.keep[:notice] = ["Invalid token"]
      redirect to('/users/reset-password')
    end
  end

  get "/users/:id" do
    if logged_in?
      @user = User.get(params[:id])
      if current_user?(@user)
        @user = User.get(params[:id])
        erb(:user)
      else
        flash.keep[:notice] = ["You can only access your own profile"]
        redirect to("/users/#{current_user.id}")
      end
    else
      flash.keep[:notice] = ["You need to login to peep!"]
      redirect to("/users/new")
    end
  end

  get "/log-in" do
    erb(:log_in)
  end

  post '/sessions/new' do
    user = User.first(user_name: params[:user_name])
      if user
        if user.authenticated?(params[:password])
          log_in(user)
        else
          flash.now[:notice] = ["Wrong password"]
          erb(:log_in)
        end
      else
        flash.now[:notice] = ["User does not exist"]
        erb(:log_in)
      end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = ['Goodbye!']
    redirect to('/log-in')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/peeps' do
    current_user
    peep = current_user.peeps.new(peep: params[:peep])
    if peep.save
        flash.now[:notice] = ["Peep was created created"]
        redirect to("/peeps/#{peep.id}")
    else
        flash.now[:notice] = ["Peep could not be created"]
        erb(:user)
    end
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    @comments = @peep.comments.reverse
    erb(:peep)
  end

  post '/comments' do
    comment = current_user.comments.new(comment: params[:comment], peep_id: params[:peep_id])
    if comment.save
      flash.now[:notice] = ["Comment was created created"]
      redirect to("/comments/#{comment.id}")
    else
      flash.now[:notice] = ["Comment could not be created"]
      redirect back
    end
  end

  get '/comments/:id' do
    @comment = Comment.get(params[:id])
    erb(:comment)
  end



  helpers do

    def log_in(user)
      session[:user_id] = user.id
      redirect to("/users/#{user.id}")
    end

    def current_user?(user)
      current_user == user
    end

    def current_user
      @user = User.get(session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
