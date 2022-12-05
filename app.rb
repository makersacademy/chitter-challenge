require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @users = UserRepository.new
    
    repo = PeepRepository.new
    @peeps = repo.all
    if session[:user_id] != nil
      @user = @users.find(session[:user_id])
      return erb(:home_logged_in)
    else
      return erb(:home)
    end
  end

  get '/new' do
    if session[:user_id] != nil
      return erb(:new_post)
    else
      redirect '/'
    end
  end

  post '/new' do
    repo = UserRepository.new
    new_peep = Peep.new

    new_peep.message = params[:message]
    new_peep.time = Time.now
    new_peep.user_id = session[:user_id]

    repo = PeepRepository.new
    repo.create(new_peep)

    return erb(:confirm_new_post)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    new_user = User.new
    
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo = UserRepository.new
    repo.create(new_user)
    session[:user_id] = repo.find_by_name(new_user.name).id
    return erb(:confirm_signup)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    username = params[:username]
    password = params[:password]
    
    repo = UserRepository.new
    @user = repo.find_by_username(username)
    if repo.login(username, password)
      session[:user_id] = @user.id
      return erb(:confirm_login)
    else
      return erb(:failed_login)
    end
  end

  get '/logout' do
    session[:user_id] = nil
    return erb(:logged_out)
  end
end
