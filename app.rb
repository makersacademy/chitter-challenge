require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/peep'
require_relative 'lib/user_repository'
require_relative 'lib/user'

require 'date'
require 'cgi'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    # set :show_exceptions, false
    set :raise_errors, false
    enable :sessions
  end
  
  get '/' do
   return erb(:index)
  end
  
  # ------
  # /peeps
  # ------

  get '/peeps' do
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  # FURTHER TESTS REQUIRED
  get '/peeps/new' do
    if session[:user_id] == nil
      return erb(:'/sessions/login')   
    else
      return erb(:peeps_new)
    end
  end

  get '/peeps/posted' do
    return erb(:peeps_posted)
  end

  post '/peeps' do
   
    # currently missing input validation check(s)
    peep = Peep.new         
    peep.content = CGI::escapeHTML(params[:content])
    peep.date_time = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
    peep.user_f_name = session[:user_f_name]
    peep.user_handle = session[:user_handle]

    repo = PeepRepository.new
    repo.create(peep)

    return erb(:peeps_posted)

  end

  # ------
  # /users
  # ------

  get '/users/signup' do
    return erb(:signup)
  end

  get '/users/user-created' do
    return erb(:user_created)
  end

  post '/users/signup' do
    user = User.new    
    user.email = CGI::escapeHTML(params[:email])
    user.password = CGI::escapeHTML(params[:password])
    user.f_name = CGI::escapeHTML(params[:f_name].capitalize)
    user.handle = CGI::escapeHTML(params[:handle])

    repo = UserRepository.new
    repo.create(user)
    @last_user_created = repo.all.last

    return erb(:user_created)
  end

  get '/sessions/login' do
    return erb(:'/sessions/login')
  end

  get '/sessions/logout' do
    session[:user_id] = nil
    return erb(:index)
  end

  # FURTHER TESTS REQUIRED
  post '/sessions' do    
    repo = UserRepository.new
    @user = repo.find_by_email(params[:email])
    
    if params[:password] == @user.password
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      session[:user_f_name] = @user.f_name
      session[:user_handle] = @user.handle
      return erb(:'/sessions/login_success')
    else
      return erb(:'/sessions/login_error')
    end
  end

  # ------
  # /errors
  # ------

  error do
    return erb(:error)
  end

end
