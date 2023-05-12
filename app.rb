require 'sinatra/base'
require 'sinatra/reloader'
require 'date'
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    if session[:user_id] != nil
      return redirect('/userpage')
    end
    peep_repo = PeepRepository.new
    @users = UserRepository.new
    @peeps = peep_repo.all.sort_by!{ |peep| peep.time }.reverse!
    return erb(:index)
  end

  post '/logged_in' do
  end


  get '/logged_in' do
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @users = UserRepository.new
    @peeps = peep_repo.all.sort_by!{ |peep| peep.time }.reverse!
    return erb(:peeps)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do

    users = UserRepository.new
    user = User.new
    last_user = users.all.last
    user_id = (last_user.id) - 1
    user.name = params[:name]
    user.email = params[:email]
    user.username = params[:username]
    user.password = params[:password]
    session[:user_id] = user.id

    users.create(user)

    user = users.find_by_username(user.username)
    session[:user_id] = user.id

    redirect "/logged_in"

  end
end
