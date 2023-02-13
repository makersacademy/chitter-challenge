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

  get '/' do
    if session[:username] == nil
      peeprepo = PeepRepository.new
      @peeps_with_username = add_username_to_peep()
      @peeps = @peeps_with_username.reverse
      @logged_in = false
      return erb(:index)
    else
      peeprepo = PeepRepository.new
      @peeps_with_username = add_username_to_peep()
      @peeps = @peeps_with_username.reverse
      @logged_in = true
      return erb(:index)
    end
  end

  post '/peep' do
    repo = PeepRepository.new
    newpeep = Peep.new
    newpeep.message = params[:message]
    newpeep.post_time = find_current_time()
    newpeep.post_date = find_current_date()
    newpeep.user_id = session[:user_id]
    repo.create(newpeep)
    return redirect '/'
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
    return redirect '/'
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
      return redirect '/'
    else
      @login = false
      return erb(:login)
    end
  end

  post '/logout' do
    session[:user_id] = nil
    session[:username] = nil
    return redirect '/'
  end

  get "/logout" do
    session[:user_id] = nil
    session[:username] = nil
    redirect "/"
  end

  #Helper methods
  def add_username_to_peep
    peeprepo = PeepRepository.new
    userrepo = UserRepository.new
    all_peeps = peeprepo.all
    all_peeps.each do |peep|
      peep.username = userrepo.find_by_id(peep.user_id).username
    end
    return all_peeps
  end

  def find_current_time
    t = Time.now
    return t.strftime("%k:%M:%S")
  end

  def find_current_date
    t = Time.now
    return t.strftime("%Y-%m-%d") 
  end

  def organise(peeps)
    sorted_peeps = peeps.sort_by do |peep|
      Time.new(peep.post_date.year, peep.post_date.month, peep.post_date.day, peep.post_time.hour, peep.post_time.min, peep.post_time.sec)
    end
    return sorted_peeps
  end
  
 end