require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    repo = PostRepository.new
    @posts = repo.all.sort_by!(&:time).reverse!

    return erb(:index)
  end

  get '/signup' do
    @signup_error_message = ""
    return erb(:signup)
  end

  post '/signup' do

    @email = params[:email]
    @username = params[:username]
    @repo = UserRepository.new

    if invalid_email_format?
      @signup_error_message = "Incorrect email format, please re-submit"
      return erb(:signup)
    end

    if duplicate_email_or_username?
      @signup_error_message = "Duplicate email or username, please re-submit"
      return erb(:signup)
    end

    @repo.create(params_to_new_user(params))
    return erb(:signup_complete)
  end

  get '/new' do
    repo = UserRepository.new
    @users = repo.all
    return erb(:add_post)
  end

  post '/new' do
    repo = PostRepository.new
    new_post = Post.new
    new_post.content = params[:content]
    new_post.user_id = params[:user_id]
    repo.create(new_post)

    return erb(:post_added)
  end
  
  get '/login' do
    @login_error_message = ""
    return erb(:login)
  end

  post '/login' do
    repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]

    email = new_user.email
    user = repo.find_by_email(email)
    
    return nil if user.nil?
    if new_user.password == BCrypt::Password.new(user.password)
      return "login success"
    else
      return "wrong password"
    end
  end

  private

  def invalid_email_format?
    return @email !~ URI::MailTo::EMAIL_REGEXP
  end

  def duplicate_email_or_username?
    @repo.all.each do |user|
      return (user.email == @email || user.username == @username)
    end
  end

  def params_to_new_user(params)
    new_user = User.new
    new_user.name = params[:name]
    new_user.email = @email
    new_user.password = params[:password]
    new_user.username = @username
    return new_user
  end

end
