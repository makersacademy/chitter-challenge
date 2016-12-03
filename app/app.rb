ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require "./app/models/user"
require "./app/models/peep"
require "./app/models/comment"
require_relative "datamapper_setup"
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/users/new' do
    @user = User.new
    erb(:sign_up)
  end

  post '/users' do
      @user = User.new(email: params[:email], name: params[:name], user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to("/users/#{@user.id}")
      else
        flash.now[:notice] = @user.errors.full_messages
        erb(:sign_up)
      end
  end

  get "/users/:id" do
    if logged_in?
      @user = User.get(params[:id])
      erb(:user)
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
      if user.authenticated?(params[:password])
        session[:user_id] = user.id
        redirect to("/users/#{user.id}")
      else
        flash.now[:notice] = ["Wrong password"]
        erb(:log_in)
      end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = ['goodbye!']
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
    @comments = @peep.comments
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
