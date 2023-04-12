require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    @all_peeps = PeepRespository.new.all_by_rev_date_order_with_author
    return erb(:index)
  end

  get '/login' do
    if session[:user_id]
      return redirect('/')
    end

    return erb(:login)
  end

  post '/login_attempt' do
    # TODO : Santise user input from this form
    if session[:user_id]
      return redirect('/')
    end

    # Returns a User object if succesful
    login = UserRepository.new.login(params[:username], params[:password])

    if login == nil
      @failure_reason = "username"
      status 401
      return erb(:login_denied)
    elsif login == false
      @failure_reason = "password"
      status 401
      return erb(:login_denied)
    else
      session[:user_id] = login.id
      session[:username] = login.username
      # TODO: Do I need this boolean variable?
      # session[:logged_in] = true
      return redirect('/')
    end
  end
      

    # user = UserRepository.new.find_by_username(username)
    # if !user
    #   @failure_reason = "username"
    #   status 401
    #   return erb(:login_denied)
    # elsif password != user.password
    #   status 401
    #   @failure_reason = "password"
    #   return erb(:login_denied)
    # # Is this conditonal statement robust enough?
    # elsif password == user.password
    #   session[:user_id] = user.id
    #   session[:username] = user.username
    #   # TODO: Do I need this boolean variable?
    #   # session[:logged_in] = true
    #   return redirect('/')


  get '/register' do
    # TODO : Santise user input from this form
    if session[:user_id]
      return redirect('/')
    end

    return erb(:register)
  end

  post '/submit_register' do

    # if UserRepository.new.find_by_username(params[:username])
    #   return erb (:deny_register)

    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    UserRepository.new.create(user)

    return erb(:register)
  end
end