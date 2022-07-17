require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  # get '/' do 
  
  # end

  get '/' do
    repo = UserRepository.new
    # First page: give the form to sign in
    return erb(:index)
  end
  
  post '/signup' do
    email = params[:email]
    repo = UserRepository.new
    if repo.find_by_email(email) == nil
      new_user = User.new
      new_user.id = params[:id]
      new_user.name = params[:name]
      new_user.username = params[:username]
      new_user.email = email
      new_user.password = params[:password]

      user = UserRepository.new
      user.create(new_user)
      return erb(:post_signup)
    else
      return erb(:error_signup)
    end
  end

  get '/login' do 
    repo = UserRepository.new
    return erb(:get_login)
  end

  post '/login' do 
    email = params[:email]
    password = params[:password]
    repo = UserRepository.new
    user = repo.find_by_email(email)
    if user == nil || user.password != password
      return erb(:error_login)
    else
      return erb(:post_login)
    end
  end

  post '/peeps' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.id = params[:id]
    new_peep.content = params[:content]
    new_peep.date = params[:date]
    new_peep.user_id = params[:user_id]
    repo.create(new_peep)
    return erb(:peep_created)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:get_peeps)
  end
end
    