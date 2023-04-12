#require_relative '../models/user'
require_relative '../repo/user_repository'
require 'sinatra'
require 'bcrypt'
#require "sinatra/reloader"
require_relative './database_connection'

DatabaseConnection.connect

class UserController < Application
  configure :development do
    enable :sessions
  end

  def user_form_invalid
    return true if params[:name].length == 0 || params[:email].length == 0 || params[:username].length == 0 || params[:password].length == 0
    return false
  end

  def sanitise(list)
    ['<html>', '<script>'].any? { |inj| list.include?(inj) }
  end

  post '/signup' do
    if user_form_invalid
      status 400
      return ''
    end
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    sanitise_list = [name, username, email, password]
    if sanitise(sanitise_list)
      return "Nice try Buddy!"
    end
    user_repo = UserRepository.new
    user = User.new
    user.name = name
    user.username = username
    user.email = email
    user.password = BCrypt::Password.create(password)

    user_repo.create(user)

    session[:user_id] = user.user_id
      redirect '/'
  end

  post '/login' do
    user_repo = UserRepository.new
    user = user_repo.find_user_by_username(params[:username])
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.user_id
      redirect '/'
    else
      return "Username not found or incorrect credentials"
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end
end