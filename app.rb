require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'bcrypt'

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
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    peeps = peep_repo.all

    @complete_peep_info = []

    peeps.each do |peep|
      user = user_repo.find(peep.user_id)
      peep_info = {peep: peep, name: user.name, username: user.username}
      @complete_peep_info << peep_info
    end

    return erb(:index)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    user_repo = UserRepository.new

    user = user_repo.find_by_email(email)
    stored_password = BCrypt::Password.new(user.password)

    if stored_password == password
      return erb(:login_success)
    else
      return erb(:wrong_password)
    end
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepository.new
    new_user = User.new

    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo.create(new_user)

    return erb(:signup_success)
  end

  # add invalid_parameters? method
end
