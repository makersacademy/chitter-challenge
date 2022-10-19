require 'sinatra'
require 'pony'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # Sessions are disabled by default, so this line is needed.
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get '/sign_up' do
    if session[:user_id].nil?
      erb(:sign_up)
    else
      redirect('/posts')
    end
  end

  post '/users' do
    repo = UserRepository.new
    if invalid_user_request_parameters?
      erb(:sign_up_error_empty)
    elsif !repo.find_by_email(params[:email]).nil?
      erb(:sign_up_error_email)
    elsif !repo.find_by_username(params[:username]).nil?
      erb(:sign_up_error_username)
    else
      user = User.new
      user.username = params[:username]
      user.name = params[:name]
      user.email = params[:email]
      user.password = params[:password]

      repo.create(user)

      erb(:sign_up_successful)
    end
  end

  # This route simply returns the login page
  get '/login' do
    if session[:user_id].nil?
      erb(:login)
    else
      erb(:login_success)
    end
  end

  # This route receives login information (email and password)
  # as body parameters, and find the user in the database
  # using the email. If the password matches, it returns
  # a success page.
  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    user = repo.find_by_email(email)

    # This is a simplified way of
    # checking the password. In a real
    # project, you should encrypt the password
    # stored in the database.

    if repo.sign_in(email, password)
      # Set the user ID in session
      session[:user_id] = user.id

      erb(:login_success)
    else
      erb(:login_error)
    end
  end

  post '/logout' do
    session[:user_id] = nil

    redirect('/login')
  end

  get '/posts' do
    @current_user = session[:user_id]
    repo = PostRepository.new
    @repo2 = UserRepository.new

    @posts = repo.all

    erb(:posts)
  end

  get '/posts/new' do
    if session[:user_id].nil?
      redirect('/login')
    else
      erb(:posts_new)
    end
  end

  post '/posts' do
    if invalid_post_request_parameters?
      erb(:post_error)
    else
      repo = PostRepository.new
      post = Post.new
      post.content = params[:content]
      post.time_posted = Time.now
      post.user_id = session[:user_id]

      repo.create(post)

      erb(:post_success)
    end
  end

  private

  def invalid_user_request_parameters?
    params[:username].nil? || params[:name].nil? || params[:email].nil? || params[:password].nil?
  end

  def invalid_post_request_parameters?
    params[:content].nil?
  end
end
