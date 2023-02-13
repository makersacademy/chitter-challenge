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
      @user = user_repo.find('id', current_user_id)
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
    return status 400 unless %i[username password].all? { params.key?(_1) }

    repo = UserRepository.new
    user = repo.find('username', params[:username])

    if user
      if test_password(params[:password], user.password)
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
    return status 400 unless %i[email password name username].all? { params.key?(_1) }

    repo = UserRepository.new

    # check if username and email exist in db

    find_by_username = repo.find('username', params[:username])
    find_by_email = repo.find('email', params[:email])

    params[:password] = hash_password(params[:password])

    user = User.new(params)
    repo.create(user)

    user = repo.find('username', params[:username])

    session.clear
    session[:user_id] = user.id
    redirect '/'
  end

  post '/post' do
    return status 400 unless params.key?(:content)

    repo = PostRepository.new
    params[:timestamp] = Time.now
    params[:user_id] = session[:user_id]

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
