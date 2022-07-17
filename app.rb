require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection.rb'
require_relative 'lib/message_repository'
require_relative 'lib/user'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload
    configure do
        enable :sessions
    end
  end

  post '/' do
    session[:id] ? @logged_in = true : @logged_in = false
    new_message = Message.new
    new_message.message = params[:message]
    new_message.date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    new_message.author_id = session[:id]

    repo = MessageRepository.new
    repo.create(new_message)

    repo = MessageRepository.new
    @messages = repo.messages_with_authors

    return erb(:index)
  end

  get '/new-peep' do
    # functionality to add: if no message was inserted
    return erb(:new_peep)
  end

  get '/sign-up' do
    return erb(:sign_up)
  end

  get '/log-in' do
    return erb(:log_in)
  end

  post '/thank-you' do
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]

    repo = UserRepository.new
    @user_exists = repo.find_by_email(user.email)
    repo.create(user) if !@user_exists
    return erb(:thank_you)
  end

  post '/done' do
    email = params[:email]
    password = params[:password]
    repo = UserRepository.new
    # returns nil if the email doesn't exist, returns false if the pw is incorrect, returns true if pw correct
    @credentials_correct = repo.sign_in(email,password)
    user = repo.find_by_email(email)
    # saves the email of the user in the session
    session[:id] = user.id if @credentials_correct

    return erb(:done)
  end

  get '/' do
    repo = MessageRepository.new
    @messages = repo.messages_with_authors
    session[:id] ? @logged_in = true : @logged_in = false
    return erb(:index)
  end

  get '/logout' do
    session[:id] = nil
    return erb(:logout)
  end

end

