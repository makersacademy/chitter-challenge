require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    post_repo = PostRepository.new
    sort_by_time(post_repo.all)
    return erb(:index)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/login/new' do
    return(:index)
  end

  post '/login' do
    if user_name_exists?(params[:user_name]) # Checks if the user_name is in the database
      user_repo = UserRepository.new
      @result = user_repo.find_by_user_name(params[:user_name])
      if @result.password == params[:password] # Checks if the password given matches the user's password
        posts_repo = PostRepository.new
        sort_by_time(posts_repo.all)
        return erb(:user) 
      else 
        return erb(:loginfailed) # If given password doesn't match user's password, login failed page displayed
      end
    else 
      return erb(:signup) # If user_name doesn't exit, user taken to sign up page
    end
  end

  post '/newpost' do
    user_repo = UserRepository.new
    @result = user_repo.find_by_user_name(params[:user_name])
    posts_repo = PostRepository.new
    new_post = Post.new
    new_post.message = params[:message]
    new_post.timestamp = Time.now
    new_post.user_id = @result.id
    new_post.name = @result.name
    new_post.user_name = @result.user_name
    posts_repo.create(new_post)
    @posts = sort_by_time(posts_repo.all)
    return erb(:user)
  end

  get '/newpost' do
    return erb(:login)
  end

  post '/signup' do
    return erb(:signupfailed) if email_exists?(params[:email]) 
    return erb(:usernamesignup) if user_name_exists?(params[:user_name])
    user_repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.user_name = params[:user_name]
    new_user.email = params[:email]
    new_user.password = params[:password]
    user_repo.create(new_user)
    return erb(:login)
  end

  private 

  def sort_by_time(posts)
    posts.sort_by! { |post| post.timestamp }
    @posts = posts.reverse
    return @posts
  end

  def user_name_exists?(user_name)
    user_repo = UserRepository.new
    users = user_repo.all
    user_name_exist = false
    users.each { |user| user_name_exist = true if user.user_name == user_name }
    return user_name_exist
  end

  def email_exists?(email)
    user_repo = UserRepository.new
    users = user_repo.all
    email_exist = false
    users.each { |user| email_exist = true if user.email == email }
    return email_exist
  end
end