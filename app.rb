require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/message_repository'
require_relative 'lib/user_repository'
require_relative 'lib/message'
require_relative 'lib/user'
require 'capybara/rspec'

DatabaseConnection.connect


class Application < Sinatra::Base
  enable :sessions
  set :public_folder, File.join(File.dirname(__FILE__), 'public')
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
    session[:user_id] = new_user.id 
    redirect to :login
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
      session[:user_id] = user.id 
      redirect to :/
    else erb(:login_failure)
    end

  end 

  post '/logout' do
    session[:user_id] = nil
    redirect to :login
  end

  get '/peep/new' do 

    return erb(:new_peep)

  end

  post '/peep' do 

    messages_repo = MessageRepository.new
    @user_repo = UserRepository.new
    new_message = Message.new 
    new_message.content = params[:content]
    new_message.time_posted = DateTime.now
    new_message.user_id = session[:user_id]

    messages_repo.create(new_message)

    @message_content = new_message.content

    return erb(:new_peep_created)

  end 
  
end
