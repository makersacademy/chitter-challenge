require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
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
    peeprepo = PeepRepository.new
    # @peeps = peeprepo.all.reverse
    @peeps = add_username_to_peep()
    return erb(:home)
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
      return login successful
    else
      @login = false
      return erb(:login)
    end
  end
 end