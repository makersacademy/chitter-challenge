# file: app.rb

require 'sinatra'
require "sinatra/reloader"
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/message_repository'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/message_repository'
  end

  get '/' do
    repo = MessageRepository.new
    @messages = repo.all.sort_by(&:created_at).reverse

    @tags = []
    
    user_info = UserRepository.new
    tag = user_info.all
    tag.each do | username |
        @tags << "@#{username.username}"
    end
    return erb(:index)
  end

  post '/' do
    if invalid_request_parameters?
      status 400
      return ''
    end

    redirect '/login' if session[:user_id] == nil
    
    title = params[:title]
    content = params[:content]
    tags = params[:tags]


    repo = MessageRepository.new
    new_message = Message.new
    new_message.title = params[:title]
    new_message.content = params[:content]
    new_message.posted_by = session[:user_id] 
    new_message.tags = params[:tags]
    
    repo.create(new_message)

    redirect '/'
  end

  get '/sign_up' do
    return erb(:sign_up)
  end

  post '/sign_up' do
    email = params[:email]
    password = params[:password]
    username = params[:username]
    name = params[:name]

    repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    new_user.username = params[:username]   
    new_user.name = params[:name]  

    repo.create(new_user)

    return erb(:login)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    user = repo.find(email)

    stored_password = BCrypt::Password.new(user.password)
    if stored_password == password
      session[:user_id] = user.username
      redirect '/'
    else
      return erb(:login_error)
    end
  end

  get '/log_out' do
    destroy
    redirect '/'
  end

  def invalid_request_parameters?
    return true if params[:title].nil? || params[:title].empty? ||
                    params[:content].nil? || params[:content].empty? 
    false
  end

  def destroy      
    session[:user_id] = nil     
  end  
end