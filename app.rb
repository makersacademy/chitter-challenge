# file: app.rb
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repo'
require_relative 'lib/user_repo'

DatabaseConnection.connect

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repo'
    also_reload 'lib/user_repo'
  end

  get '/' do
    @posts = PostRepo.new
    return erb(:index)
  end

  post '/create' do
    post = Post.new
    post.message = params[:message]
    post.name = params[:name]
    post.user_id = params[:user_id]
    @posts = PostRepo.new
    @posts.create(post)
    @users = UserRepo.new
    @users.all.each do |record|
      if record.id.include?(params[:user_id])
        @user = record
        @posts = PostRepo.new
      end
    end
    return erb(:logged_in)
  end

  post '/create_random' do
    post = Post.new
    post.message = params[:message]
    post.name = params[:name]
    post.user_id = 3
    @posts = PostRepo.new
    @posts.create(post)
    return erb(:index)
  end

  get '/register' do
    return erb(:register)
  end

  post '/login' do
    @users = UserRepo.new
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    @users.all.each do |record|
      if record.username.include?(user.username.to_s) && record.password.include?(user.password.to_s)
        @user = record
        @users.login(@user.id)
        @posts = PostRepo.new
        return erb(:logged_in)
      end
    end
    return erb(:password_username_error)
  end



  get '/login' do
    return erb(:log_in_page)
  end

  post '/create_user' do
    user = User.new
    user.name = params[:name]
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    @users = UserRepo.new

    @users.all.each do |record|
      if record.email.include?(user.email) || record.username.include?(user.username)
        return erb(:user_error)
      end
    end
    @users.create(user)
    return erb(:user_added)
  end

  post '/delete_post/:id' do
    @posts = PostRepo.new
    @posts.delete(params[:id])
    @posts = PostRepo.new
    return erb(:index)
  end

  post '/delete_user/:id' do
    @users = UserRepo.new
    @users.delete(params[:id])
    @posts = PostRepo.new
    return erb(:index)
  end

  post '/logout/:id' do
    @users = UserRepo.new
    @users.logout(params[:id])
    @posts = PostRepo.new
    return erb(:index)
  end
end
