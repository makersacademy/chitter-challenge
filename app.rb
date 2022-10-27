require 'rubygems'
require 'sinatra'
require 'pony'
require 'mail'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  set :public_folder, __dir__ + '/public'

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get "/" do
    @current_user = session[:user_id]
    erb(:home)
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
    elsif invalid_email?
      erb(:sign_up_error_invalid_email)
    elsif !repo.find_by_email(params[:email]).nil?
      erb(:sign_up_error_email)
    elsif !repo.find_by_username(params[:username]).nil?
      erb(:sign_up_error_username)
    else
      user = User.new
      user.username = params[:username] if params[:username] !~ /<\w+>/
      user.name = params[:name] if params[:name] !~ /<\w+>/
      user.email = params[:email] if params[:email] !~ /<\w+>/
      user.password = params[:password] if params[:password] !~ /<\w+>/
      repo.create(user)
      erb(:sign_up_successful)
    end
  end

  get '/login' do
    if session[:user_id].nil?
      erb(:login)
    else
      erb(:login_success)
    end
  end

  post '/login' do
    email = params[:email]
    password = params[:password]
    repo = UserRepository.new
    user = repo.find_by_email(email)
    if repo.sign_in(email, password)
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
    @repo = PostRepository.new
    @repo2 = UserRepository.new
    @posts = @repo.all
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
      post.content = params[:content] if params[:content] !~ /<\w+>/
      post.time_posted = Time.now
      post.user_id = session[:user_id]
      repo.create(post)
      repo2 = UserRepository.new
      @content = post.content
      @user = repo2.find_by_id(post.user_id)
      send_email(post, repo, repo2) if repo.user_mentioned?(post)
      erb(:post_success)
    end
  end

  get '/post/:id' do
    @repo = PostRepository.new
    @post = @repo.find(params[:id])
    @repo2 = UserRepository.new
    @posts = @repo.all_replies(@post)
    erb(:post)
  end

  get '/reply/:id' do
    if session[:user_id].nil?
      redirect('/login')
    else
      @repo = PostRepository.new
      @repo2 = UserRepository.new
      @post = @repo.find(params[:id])
      erb(:reply_new)
    end
  end

  post '/reply/:id' do
    if invalid_post_request_parameters?
      erb(:post_error)
    else
      repo = PostRepository.new
      parent = repo.find(params[:id])
      repo2 = UserRepository.new
      user = repo2.find_by_id(parent.user_id)
      post = Post.new
      post.content = "@#{user.username} #{params[:content]}" if params[:content] !~ /<\w+>/
      post.time_posted = Time.now
      post.user_id = session[:user_id]
      post.parent_id = parent.id
      repo.create(post)
      repo2 = UserRepository.new
      @content = post.content
      @user = repo2.find_by_id(post.user_id)
      send_email(post, repo, repo2) if repo.user_mentioned?(post)
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

  def invalid_email?
    params[:email].match(/(\w*@\w+\.(\w+ |\w+.\w+))/).nil?
  end

  def send_email(post, repo, repo2)
    emails = repo.mentioned_users(post)
    user = repo2.find_by_id(session[:user_id])
    emails.each do |email|
      Pony.mail(to: email,
                from: user.email,
                subject: "You've been mentioned in a Peep on Chitter",
                body: erb(:email),
                via: :smtp,
                via_options: {
                  address:              "smtp.yourserver.com",
                  port:                 "25",
                  domain:               "onrender.com",
                  authentication:       :plain,
                  enable_starttls_auto: true,
                  user_name:            "user",
                  password:             "password"
                }
              )
    end
  end
end
