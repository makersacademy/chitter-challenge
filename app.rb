require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection'
require_relative './lib/comment_repository'
require_relative './lib/peep_repository'
require_relative './lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    session.clear
    @peep_repository = PeepRepository.new 
    @user_repository = UserRepository.new 
    @comment_repository = CommentRepository.new
    return erb(:homepage)
  end

  get '/signup' do 
    return erb(:signup)
  end

  get '/logged_in' do 
    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    return erb(:homepage)
  end

  get '/incorrect-details' do 
    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    return erb(:incorrect_details)
  end

  get '/replies/:peep_id' do 
    comment_repository = CommentRepository.new 
    @comments = comment_repository.find_by_peep(params[:peep_id])
    @user_repository = UserRepository.new
    @peep_repository = PeepRepository.new
    @peep_id = params[:peep_id]
    return erb(:replies)
  end

  get '/:user_id' do
    @peep_repository = PeepRepository.new
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    @user = @user_repository.find_by_id(params[:user_id])
    return erb(:peeps_by_user)
  end

  post '/signup' do 
    @user_repository = UserRepository.new 
    new_user = User.new 
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email] 
    new_user.password = params[:password]
    taken = @user_repository.check_if_username_or_email_taken(params[:username], params[:email])
    return erb(:taken_details) if taken
    @user_repository.create(new_user)
    user = @user_repository.find_by_username(params[:username])
    session[:user_id] = user.id
    return redirect '/logged_in'
  end

  post '/credentials_checker' do
    @user_repository = UserRepository.new
    all_users = @user_repository.all 
    @valid_details = all_users.any? { |user| (user.username == params[:username]) and (BCrypt::Password.new(user.password) == params[:password])}
    if @valid_details
      user = @user_repository.find_by_username(params[:username])
      session[:user_id] = user.id
      return redirect '/logged_in'
    else
      return redirect '/incorrect-details'
    end
  end
  
  post '/peep/new' do 
    peep_repository = PeepRepository.new 
    peep = Peep.new 
    peep.time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    peep.user_id = session[:user_id]
    peep.content = params[:content]
    check_if_peep_or_reply_contains_tag(params[:content])
    peep_repository.create(peep)
    return redirect '/logged_in'
  end

  post '/reply/:peep_id/new' do 
    @user_repository = UserRepository.new
    @peep_repository = PeepRepository.new
    @comment_repository = CommentRepository.new 
    comment = Comment.new 
    comment.time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    comment.user_id = session[:user_id]
    comment.content = params[:content]
    comment.peep_id = params[:peep_id]
    return redirect "/replies/#{params[:peep_id]}" if params[:content].empty?
    check_if_peep_or_reply_contains_tag(params[:content])
    @comment_repository.create(comment)
    return redirect "/replies/#{params[:peep_id]}"
  end

  def check_if_peep_or_reply_contains_tag(content)
    user_repository = UserRepository.new
    usernames = user_repository.all.map(&:username)
    usernames.each do |username|
      if content.include? ("@#{username}")
        # send email
      end
    end
  end
end


