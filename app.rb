require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/peep'
require_relative 'lib/user'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  enable :sessions

  get '/' do
    return erb(:homepage)
  end

  get '/peeps' do
    peep_repository = PeepRepository.new
    user_repository = UserRepository.new
    @peeps = peep_repository.all
    @users = user_repository.all
    return erb(:peeps)
  end
 
  get '/peeps/new' do
    redirect '/' if session[:user] == nil
    return erb(:create_peep)
  end

  post '/peeps/new' do
    if invalid_param?
      status 400
      return erb(:create_peep)
    end
    peep = Peep.new
    repository = PeepRepository.new
    peep.content = params[:content]
    peep.user_id = session[:user].id
    repository.create(peep)
    return erb(:peep_created)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    if invalid_param?
      status 400
      return erb(:signup)
    end
    user = User.new
    repository = UserRepository.new
    user.name = params[:name]
    user.username = params[:username]
    user.email_address = params[:email_address]
    user.password = params[:password]

    repository.sign_up(user)
    session[:user] = repository.log_in(user.email_address, user.password)
    return erb(:account_created)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email_address = params[:email_address]
    password = params[:password]
    if invalid_user_param?
      status 400
      return erb(:login)
    end
  
    repository = UserRepository.new

    @user = repository.log_in(email_address, password)
    if !!@user
      session[:user] = @user
      return erb(:login_success)
    else
      status 400
      return erb(:login)
    end
  end

  get '/logout' do
    session[:user] = nil
    return erb(:logout)
  end

  def invalid_param?
    return true if params[:content] == ""
    return true if params[:name] == ""
    return true if params[:username] == ""
    return true if params[:password] == ""
  end

  def invalid_user_param?
    return true if params[:email_address] == ""
    return true if params[:password] == ""
  end
end