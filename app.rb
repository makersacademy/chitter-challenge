require 'sinatra/base'
require_relative 'models/user'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :sessions_secret, 'secret'
 attr_reader :user
get '/' do
  erb :first_screen
end

get'/login' do
  erb :login
end

get '/sign_up' do

erb :sign_up
end
get  '/logged_in' do
    @user_name=session[:user_name]

  erb :logged_in
end

get '/cheeps' do
  @post =Post.all
  erb :cheeps
end
post '/cheeps' do
@post = Post.all.reverse
  erb :cheeps
end

post '/logged_in' do
  @user_name=session[:user_name]
  post=Post.create(post: params[:post])
  @post= Post.all
  # if @post == []
  # @post = params[:post]
  #  end
  @time = post.created_at
  post.save
  erb :logged_in
end



 post '/login' do
   user = User.authenticate(params[:user_name], params[:password])
   if user
     session[:user_id] = user.id
      session[:user_name]= user.user_name
        @user_name=session[:user_name]
     user.save
   erb :logged_in
 else
   erb :error
 end
 end


 delete '/log_out' do
   session[:user_id] = nil
   erb :first_screen
 end

post '/confirmation_screen' do
user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password] )
session[:user_id] = user.id
  @first_name = params[:first_name]
  erb :confirmation_screen
end
end
