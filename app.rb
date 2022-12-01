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

  get '/' do 
    session.clear
    @peep_repository = PeepRepository.new 
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
      user = @user_repository.find_by_username(params[:username])
      session[:user_id] = user.id
      @user_id = session[:user_id]
    end


    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    return redirect '/logged_in'
  end

  post '/credentials_checker' do
    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new

    all_users = @user_repository.all 
    valid_details = all_users.any? { |user| (user.username == params[:username]) and (BCrypt::Password.new(user.password) == params[:password])}
    if valid_details
      user = @user_repository.find_by_username(params[:username])
      session[:user_id] = user.id
      @user_id = session[:user_id]
      return redirect '/logged_in'
    else
      return redirect '/incorrect-details'
    end
  end

  get '/logged_in' do 
    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    @user_id = session[:user_id]
    return erb(:homepage_logged_in)
  end

  get '/incorrect-details' do 
    @peep_repository = PeepRepository.new 
    @comment_repository = CommentRepository.new
    @user_repository = UserRepository.new
    return erb(:incorrect_details)
  end
  
  post '/peep/new' do 
    peep_repository = PeepRepository.new 
    peep = Peep.new 
    peep.time_posted = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    peep.user_id = session[:user_id]
    peep.content = params[:content]
    peep_repository.create(peep)
    return redirect '/logged_in'
  end

  get '/replies/:peep_id' do 
    comment_repository = CommentRepository.new 
    @comments = comment_repository.find_by_peep(params[:peep_id])
    @user_repository = UserRepository.new
    @peep_repository = PeepRepository.new
    @peep_id = params[:peep_id]
    if !session[:user_id].nil?
      return erb(:replies_logged_in)
    else
      return erb(:replies_not_logged_in)
    end
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
    @comment_repository.create(comment)
    return redirect "/replies/#{params[:peep_id]}"
  end
end


