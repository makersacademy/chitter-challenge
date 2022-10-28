require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/message_repository'
require_relative './lib/message'
require_relative './lib/user_repository'
require_relative './lib/user'
require_relative './lib/database_connection'
require 'date'
require 'net/smtp'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # The erb method takes the view file name (as a Ruby symbol)
    # and reads its content so it can be sent 
    # in the response.
    if params.has_key?(:me)
      @me = params[:me]
    else
      @me = 0
    end
    
    m_repo = MessageRepository.new
    u_repo = UserRepository.new
    @messages = m_repo.all
    @messages.sort!{|a, b| b.time_date <=> a.time_date}
    @users = u_repo.all
    return erb(:index)
  end

  post '/login' do
    repo = UserRepository.new
    user = User.new
    user.username = params['username']
    user.password = params['password']
    @result = repo.log_in(user)
    @users = repo.all
    me = @users.select{|element| element.username == user.username}[0]
    @me = me.id
    return erb(:login)
  end

  get '/logout' do
    @me = params[:me]
    repo = UserRepository.new
    repo.log_out(@me)
    @result = "out"
    return erb(:login)
  end

  post '/post' do
    @result = "failed"
    @me = params[:me]
    m_repo = MessageRepository.new
    u_repo = UserRepository.new
    @users = u_repo.all
    content = params[:content]
    time_date = DateTime.now
    message = Message.new
    message.content = content
    message.time_date = DateTime.now()
    message.user_id = @me
    if u_repo.find(@me).logged_in == true
      m_repo.create(message)
      @result = "posted"
    end
    @messages = m_repo.all
    @messages.sort!{|a, b| b.time_date <=> a.time_date}
    @users = u_repo.all
    return erb(:login)
  end

  get '/create' do
    @err_text = [""]
    return erb(:create)
  end

  post '/create' do
    repo = UserRepository.new
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.username = params[:username]
    @err_text = []
    users = repo.all
    match = users.select{|element| element.email == user.email}
    if match.length != 0
      @err_text << "email is not unique"
    end
    match = users.select{|element| element.username == user.username}
    if match.length != 0
      @err_text << "username is not unique"
    end
    if @err_text.length == 0
      @me = repo.create(user)[0]['id'].to_i
      @result = "created"
      return erb(:login)
    end
    return erb(:create)
  end
end
