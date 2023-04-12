require_relative 'lib/database_connection'
require_relative 'lib/user_repository.rb'
require_relative 'lib/peep_repository.rb'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base 
  # Sessions are disabled by default, so this line is needed.
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    new_user = User.new
    new_user.username = params['username']
    new_user.email = params['email']
    new_user.password = params['password']
    UserRepository.new.create(new_user)
    redirect '/peeps'
  end

end

