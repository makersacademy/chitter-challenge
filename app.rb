require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  
  enable :sessions

  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all

    if session[:user_id] == nil
      return erb(:index_default)
    else
      # populate this file
      return erb(:index_logged_in)
    end
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email_address = params[:email_address]
    password = params[:password]

    @user_repo = UserRepository.new
    user = @user_repo.find_by_email(email_address)

    # This is a simplified way of 
    # checking the password. In a real 
    # project, you should encrypt the password
    # stored in the database.
    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id

      # populate this file
      return erb(:index_logged_in)
    else
      # populate this file
      return erb(:login_error)
    end
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/:user_id' do
    @user_id = params[:user_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peeps_by_user = @peep_repo.peeps_by_user(@user_id)
    
    return erb(:user_id)
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

  # def check_login
  #   @logged_in = false

  # end
end