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

  # Loads homepage
  get '/' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all

    return erb(:index)
  end

  # Posts a peep from and to homepage (will also show on user's profile)
  post '/' do
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.date_and_time = DateTime.now()
    new_peep.user_id = session[:user_id]
    @peep_repo = PeepRepository.new
    @peep_repo.create(new_peep)

    return redirect '/'
  end

  # Loads login page
  get '/login' do
    return erb(:login)
  end

  # Loads login error page
  get '/login_error' do
    return erb(:login_error)
  end

  # Logs a user in: returns to homepage if successful, goes to error page if not
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

  # Logs user out, returns them to homepage
  get '/logout' do
    session.clear

    return redirect '/'
  end

  # Loads signup page
  get '/signup' do
    return erb(:signup)
  end

  # Creates a user
  post '/signup' do
    new_user = User.new
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]
    new_user.name = params[:name]
    new_user.username = params[:username]

    # Check if email address is valid and if email address and/or username have already been taken
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    
    URI::MailTo::EMAIL_REGEXP.match?(new_user.email_address) ? (@valid_email = true) : (@valid_email = false)    
    @email_taken = false
    @username_taken = false
    all_users.each do |user|
      @email_taken = true if user.email_address == new_user.email_address
      @username_taken = true if user.username == new_user.username
    end

    if @valid_email == true && @email_taken == false && @username_taken == false
      @user_repo.create(new_user)
      session[:user_id] = @user_repo.find_user_by_email(new_user.email_address).id
      return redirect '/'
    else
      return erb(:signup_error)
    end
  end

  # Goes to profile of user with given user_id
  get '/:user_id' do
    @user_id = params[:user_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new
    @peeps_by_user = @peep_repo.peeps_by_user(@user_id)
    
    return erb(:user_id_profile)
  end

  # Posts a peep from and to a user's own profile (will also show on homepage)
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

  # Loads a peep and its comments
  get '/peep/:peep_id' do
    @peep_id = params[:peep_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new
    @peep_by_id = @peep_repo.find_peep_by_id(@peep_id)
    @comments_by_peep = @comment_repo.comments_by_peep(@peep_id)

    return erb(:peep_with_comments)
  end

  # Posts a comment on a peep
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