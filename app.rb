require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'
require 'bcrypt'
require 'date'

DatabaseConnection.connect

class Application < Sinatra::Base
  
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all

    return erb(:index)
  end

  # ADD ERROR MESSAGE FOR EMPTY PEEP
  post '/' do
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.date_and_time = DateTime.now()
    new_peep.user_id = session[:user_id]
    
    @peep_repo = PeepRepository.new
    @peep_repo.create(new_peep)

    return redirect '/'
  end

  get '/login' do
    return erb(:login)
  end

  get '/login_error' do
    return erb(:login_error)
  end

  post '/login' do
    email_address = params[:email_address]
    password = params[:password]

    @user_repo = UserRepository.new
    user = @user_repo.find_user_by_email(email_address)

    return erb(:login_error) if user == nil

    if BCrypt::Password.new(user.password) == password
      session[:user_id] = user.id
      return redirect '/'
    else
      return erb(:login_error)
    end
  end

  get '/logout' do
    session.clear

    return redirect '/'
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    new_user = User.new
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]
    new_user.name = params[:name]
    new_user.username = params[:username]

    # Check if email address and/or password have already been taken
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    @valid_email = true
    @valid_username = true
    all_users.each do |user|
      @valid_email = false if user.email_address == new_user.email_address
      @valid_username = false if user.username == new_user.username
    end

    if @valid_email == true && @valid_username == true
      @user_repo.create(new_user)
      session[:user_id] = new_user.id
      return redirect '/'
    else
      return erb(:signup_error)
    end
  end

  get '/:user_id' do
    @user_id = params[:user_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peeps_by_user = @peep_repo.peeps_by_user(@user_id)
    
    return erb(:user_id)
  end

  # ADD ERROR MESSAGE FOR EMPTY PEEP
  post '/:user_id' do
    @user_id = params[:user_id]
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.date_and_time = DateTime.now()
    new_peep.user_id = session[:user_id]
    
    @peep_repo = PeepRepository.new
    @peep_repo.create(new_peep)

    return redirect "/#{@user_id}"
  end

  get '/peep/:peep_id' do
    @peep_id = params[:peep_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peep_by_id = @peep_repo.find_peep_by_id(@peep_id)
    @comments_by_peep = @comment_repo.comments_by_peep(@peep_id)

    return erb(:peep_with_comments)
  end

  # ADD ERROR MESSAGE FOR EMPTY COMMENT
  post '/peep/:peep_id' do
    @peep_id = params[:peep_id]
    new_comment = Comment.new
    new_comment.content = params[:content]
    new_comment.date_and_time = DateTime.now()
    new_comment.peep_id = @peep_id
    new_comment.user_id = session[:user_id]
    
    @comment_repo = CommentRepository.new
    @comment_repo.create(new_comment)

    return redirect "/peep/#{@peep_id}"
  end
end