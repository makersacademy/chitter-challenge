require 'sinatra'
require "sinatra/reloader"
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/users_repository'
require_relative 'lib/peeps_repository'

DatabaseConnection.connect

class ChitterApp < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= UserRepository.new.find_user_by_email(session[:email])
    end
  end

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/users_repository'
    also_reload 'lib/peeps_repository'
  end

  get '/' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
  
    # Debug statement
    # puts "@peeps: #{@peeps.inspect}"
  
    return erb(:peep)
  end  

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    username = params['username']
    name = params['name']
    email = params['email']
    password = params['password']
    password_hash = BCrypt::Password.create(password)
  
    UserRepository.new.create(username: username, name: name, email: email, password_hash: password_hash)
  
    redirect '/login'
  end  

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params['email']
    password = params['password']
  
    user = UserRepository.new.find_user_by_email(email)
  
    if user.nil?
      puts "User not found."
      redirect '/login'
    else
      puts "User: #{user.inspect}"
      puts "Entered password: #{password}"
      puts "Stored password hash: #{user.password_hash}"
      puts "Password comparison result: #{BCrypt::Password.new(user.password_hash) == password}"
    end
  
    if user && BCrypt::Password.new(user.password_hash) == password
      session[:user_id] = user.id
      session[:email] = user.email
      redirect '/loggedin'
    else
      redirect '/login'
    end
  end

  get '/loggedin' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
    return erb(:loggedin)
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  post '/peeps' do
    content = params['content']
    user_id = current_user.id
    PeepRepository.new.create(content: content, user_id: user_id)
    redirect '/loggedin'
  end  
end