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

DatabaseConnection.connect

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

  get '/sign_up' do
    return erb(:registration_form)
  end

  get '/comment/:peep_id' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peep = @peep_repo.find(params[:peep_id])
    @comment_repo = CommentRepository.new
    @comments = @comment_repo.find(params[:peep_id])
    return erb(:peep)
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
      redirect '/logged_in'
    end
  end

  post '/comment/:peep_id' do
    if params[:content].empty?
      redirect "/comment/#{params[:peep_id]}"
    end
    @comment_repo = CommentRepository.new
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peep = @peep_repo.find(params[:peep_id])
    comment = Comment.new
    comment.content = params[:content]
    comment.peep_id = params[:peep_id]
    comment.user_id = session[:user_id]
    comment.comment_time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    @comment_repo.create(comment)
    check_if_peep_or_reply_contains_tag(comment.content)
    redirect "/comment/#{params[:peep_id]}"
  end

  post '/new_peep/:user_id' do
    if params[:content].empty?
      redirect '/logged_in'
    end
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new
    peep = Peep.new
    peep.content = params[:content]
    peep.time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    peep.user_id = session[:user_id]
    @peep_repo.create(peep)
    check_if_peep_or_reply_contains_tag(peep.content)
    redirect '/logged_in'
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
      user_id = @user_repo.find_by_username(user.username).id
      session[:user_id] = user_id
      redirect '/logged_in'
    end
  end

  def already_signed_up
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    all_users.any? do |user|
      (params[:username] == user.username) or (params[:email_address] == user.email_address)
    end                        
    
  end

  def password_matches_user
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    all_users.any? do |user|
      (params[:username] == user.username) and BCrypt::Password.new(user.password) == (params[:password])
    end                     
    
  end

  def check_if_peep_or_reply_contains_tag(content)
    user_repository = UserRepository.new
    usernames = user_repository.all.map { |user| user.username }
    usernames.each do |username|
      if content.include? ("@#{username}")
        send_email
      end
    end
  end

  def send_email
    #This is where an email would be sent if i owned an email domain
  end
end
