
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/_repository'

DatabaseConnection.connect


class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/_repository'
  end


  get '/login' do
    return erb(:login)
  end


  post '/login' do
    username = params[:username]
    password = params[:password]

    user = UserRepository.find_by_username(username)

    if user.password == password

      session[:user_id] = user.id

      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end


  get '/account_page' do
    if session[:user_id] == nil
      # No user id in the session
      return redirect('/login')
    else
      # The user is logged in
      return erb(:account)
    end
  end
end
