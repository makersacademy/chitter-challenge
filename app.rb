require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter')

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

    username = params[:username]
    password = params[:password]
    # TODO: Break authenticate_user out into a separate method
    user = UserRepository.new.find_by_username(username)
    if !user
      @failure_reason = "username"
      status 401
      return erb(:login_denied)
    elsif password != user.password
      status 401
      @failure_reason = "password"
      return erb(:login_denied)
    # Is this conditonal statement robust enough?
    elsif password == user.password
      session[:user_id] = user.id
      session[:username] = user.username
      # TODO: Do I need this boolean variable?
      # session[:logged_in] = true
      return redirect('/')
    end
  end
end