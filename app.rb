require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/post'
require './lib/comment'
require 'sinatra/flash'
require './lib/active_record_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find_by_id(session[:user_id])
    @posts = Post.order(created_at: :desc).includes(:comments)
    erb :index
  end

  post '/add_post' do
    new_post = Post.new(peep: params[:peep], user_id: session[:user_id])
    new_post.save
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  get '/add-comment/:id' do
    @post_id = params[:id]
    @post = Post.find_by_id(@post_id)
    @post_text = @post.peep
    @post_user_id = @post.user_id
    @username = User.find_by_id(@post_user_id).username
    erb :new_comment
  end

  post '/commenting/:id' do
    Comment.create(comment: params[:comment], post_id: params[:id], user_id: session[:user_id])
    redirect "/"
  end

  post '/signing-up' do
    @new_user = User.create(
      username: params[:username], 
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      password: params[:password]
    )
    
    if User.find_by_id(@new_user.id)
      session[:user_id] = @new_user.id
      redirect '/'
    else 
      flash[:notice] = 'Please ensure you have filled all the fields'
      redirect '/sign-up'
    end
  end

  post '/logging-in' do
    @user = User.find_by(username: params[:log_in_username])

    if @user.nil?
      flash[:notice] = 'Please check your username'
      redirect '/sign-up'
    elsif @user.authenticate(params[:log_in_password])
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your password'
      redirect '/sign-up'
    end
  end

  post '/logging-out' do
    session.clear
    flash[:notice] = 'Successfully logged out'
    redirect '/'
  end

  run! if app_file == $0
end
