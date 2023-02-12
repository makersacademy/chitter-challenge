require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

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

  def add_username_to_peep
    peeprepo = PeepRepository.new
    userrepo = UserRepository.new
    all_peeps = peeprepo.all
    all_peeps.each do |peep|
      peep.username = userrepo.find_by_id(peep.user_id).username
    end
    return all_peeps
  end

  get '/home' do
    if session[:username] == nil
      peeprepo = PeepRepository.new
      @peeps = add_username_to_peep()
      return erb(:home)
    else
      peeprepo = PeepRepository.new
      @peeps = add_username_to_peep()
      @logged_in = true
      return erb(:home)
    end
  end

  post '/peep' do
    repo = PeepRepository.new
    newpeep = Peep.new
    newpeep.message = params[:message]
    newpeep.post_time = '12:12:00'
    newpeep.post_date = '2023-02-15'
    newpeep.user_id = session[:user_id]
    repo.create(newpeep)
    return redirect '/home'
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/users' do
    #add validation later
    repo = UserRepository.new
    newuser = User.new
    newuser.username = params[:username]
    newuser.password = params[:password]
    newuser.email = params[:email]
    repo.create(newuser)
    @allusers = repo.all
  end


  get '/login' do
    return erb(:login)
  end
  

  post '/login' do
    username = params[:username]
    password = params[:password]
    repo = UserRepository.new
    if repo.verify(username, password) == true
      session[:user_id] = repo.find_id_on_login(username, password)
      session[:username] = username
      peeprepo = PeepRepository.new
      @peeps = add_username_to_peep()
      @logged_in = true
      return redirect '/home'
      # return erb(:home)
    else
      @login = false
      return erb(:login)
    end
  end

  post '/logout' do
    session[:user_id] = nil
    session[:username] = nil
    return redirect '/home'
  end
 end