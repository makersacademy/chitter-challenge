require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection'
require_relative './lib/comment_repository'
require_relative './lib/peep_repository'
require_relative './lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  def initialize 
    # initialize the all 3 repos here
  end

  get '/' do 
    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @user_repository = UserRepository.new 
    @comment_repository = CommentRepository.new
    return erb(:homepage_not_logged_in)
  end

  get '/signup' do 
    return erb(:signup)
  end

  post '/signup' do 
    new_user = User.new 
    new_user.username = params[:username]
    new_user.email = params[:email] 
    new_user.password = params[:password]
    repo = UserRepository.new 
    @user_repository = UserRepository.new 
    if @user_repository.check_if_username_or_email_taken(params[:username], params[:email])
      return erb(:taken_details)
    else 
      repo.create(new_user)
    end


    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @comment_repository = CommentRepository.new
    return erb(:homepage_logged_in)
  end

  post '/credentials_checker' do
    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new

    all_users = @user_repository.all 
    valid_details = all_users.any? { |user| (user.username == params[:username]) and (BCrypt::Password.new(user.password) == params[:password])}
    if valid_details
      return erb(:homepage_logged_in)
    else
      return redirect '/incorrect-details'
    end
  end

  get '/logged_in' do 
    return erb(:homepage_logged_in)
  end

  get '/incorrect-details' do 
    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    return erb(:incorrect_details)
  end
end


def sign_in(username, submitted_password)
  user = find_by_username(username)
  return nil if user.nil?
  if submitted_password == BCrypt::Password.new(user.password)
    true
  else
    false
  end
end