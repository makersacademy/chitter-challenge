require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/message_repository'
require_relative 'lib/user_repository'
require_relative 'lib/message'
require_relative 'lib/user'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/message_repository'
    also_reload 'lib/user_repository'
  end

  get "/" do 

    messages_repo = MessageRepository.new
    @user_repo = UserRepository.new
    @timeline = messages_repo.display
   
    return erb(:timeline)
  end 

  get '/peep/new' do 

    return erb(:new_peep)

  end

  post '/peep/ ' do 

    messages_repo = MessageRepository.new
    @user_repo = UserRepository.new
    new_message = Message.new 
    new_message.content = params[:content]
    new_message.time_posted = DateTime.now
    # new_message.user_id. = @user_repo.find(params[:content])
    # messages_repo.create(new_message)
    # @artist_name = new_artist.name
    # return erb(:new_artist_created)

  end 

  get '/account/new' do 

    return erb(:new_account)

  end 

  post '/account' do 

    repo = UserRepository.new
    new_user = User.new

    new_user.username = params[:username]
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]
    new_user.full_name = params[:full_name]

    repo.create(new_user)
    @username = new_user.username
    return erb(:new_user_created)
  end  

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email_address = params[:email_address]
    password = params[:password]
    repo = UserRepository.new
    user = repo.find_by_email(email_address)

    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id
      @username = user.username
      return erb(:login_success)
    else
      return erb(:login_failure)
    end
  end
  



 

end