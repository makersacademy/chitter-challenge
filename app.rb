require 'sinatra'
require 'bcrypt'
require_relative 'repositories/database_connection'
require_relative 'repositories/user_repository'
require_relative 'repositories/post_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  get '/' do
    post_repo = PostRepository.new
    @posts = post_repo.all_with_user.reverse

    current_user_id = session[:user_id]

    if current_user_id
      user_repo = UserRepository.new
      @user = user_repo.find_by_id(current_user_id)
    end

    erb(:index)
  end

  get '/login' do
    redirect('/') if session[:user_id]

    erb(:login)
  end

  get '/signup' do
    redirect('/') if session[:user_id]

    erb(:signup)
  end

  post '/login' do
    repo = UserRepository.new
    user = repo.find_by_username(params[:username])

    if user
      if test_password(params[:password], user.password_hash)
        session.clear
        session[:user_id] = user.id
        redirect '/'
      else
        @error = 'Password incorrect'
        erb(:login)
      end
    else
      @error = 'Username does not exist'
      erb(:login)
    end
  end

  post '/signup' do
    repo = UserRepository.new

    # check params
    # check if username and email exist in db

    params[:password_hash] = hash_password(params.delete(:password))

    user = User.new(params)
    repo.create(user)

    user = repo.find_by_username(params[:username])

    session.clear
    session[:user_id] = user.id
    redirect '/'
  end

  post '/post' do
    repo = PostRepository.new
    params[:timestamp] = Time.now
    params[:user_id] = session[:user_id]

    # check params

    post = Post.new(params)
    repo.create(post)
    redirect '/'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  private

  def test_password(password, hash)
    BCrypt::Password.new(hash) == password
  end

  def hash_password(password)
    BCrypt::Password.create(password).to_s
  end

end
