require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require 'time'
require_relative 'lib/peep'
require_relative 'lib/comment'
require_relative 'lib/user'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/comment_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @comment_repo = CommentRepository.new
    return erb(:index)
  end

  get '/logged_in' do
    @peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @comment_repo = CommentRepository.new
    return erb(:logged_in)
  end

  post '/' do
    username = params[:username]
    password = params[:password]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    user = @user_repo.find_by_username(username)
    if user.nil? or !password_matches_user
      return erb(:bad_credentials)
    else
      session[:user_id] = user.id
      return erb(:logged_in)
    end
  end

  post '/comment/:peep_id' do
    @comment_repo = CommentRepository.new
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peep = @peep_repo.find(params[:peep_id])
    comment = Comment.new
    comment.content = params[:content]
    comment.peep_id = params[:peep_id]
    comment.user_id = session[:user_id]
    p session[:user_id]
    comment.comment_time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    @comment_repo.create(comment)
    redirect "/comment/#{params[:peep_id]}"
  end

  get '/sign_up' do
    return erb(:registration_form)
  end

  get '/index/:username' do
    return erb(:logged_in)
  end

  post '/sign_up' do
    user = User.new
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new
    user.name = params[:name]
    user.email_address = params[:email_address]
    user.username = params[:username]
    user.password = params[:password]
    if already_signed_up
      return erb(:bad_sign_up)
    else
      @user_repo.create(user)
      user_id = (@user_repo.find_by_username(user.username)).id
      session[:user_id] = user_id
      return erb(:logged_in)
    end
  end

  get '/comment/:peep_id' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peep = @peep_repo.find(params[:peep_id])
    @comment_repo = CommentRepository.new
    @comments = @comment_repo.find(params[:peep_id])
    return erb(:peep)
  end

  def already_signed_up
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    credentials_match = all_users.any? { |user| (params[:username] == user.username) or (params[:email_address] == user.email_address) }
    credentials_match
  end

  def password_matches_user
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    password_match = all_users.any? { |user| (params[:username] == user.username) and BCrypt::Password.new(user.password) == (params[:password]) }
    password_match
  end
end  


