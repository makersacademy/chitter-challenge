require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'
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

    return redirect '/login_error' if user == nil

    # TODO: Add password encryption
    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id

      return redirect '/'
    else
      return redirect '/login_error'
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

    @user_repo = UserRepository.new
    @user_repo.create(new_user)

    new_user = @user_repo.find_user_by_email(params[:email_address])
    session[:user_id] = new_user.id

    return redirect '/'    
  end

  get '/:user_id' do
    @user_id = params[:user_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peeps_by_user = @peep_repo.peeps_by_user(@user_id)
    
    return erb(:user_id)
  end

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