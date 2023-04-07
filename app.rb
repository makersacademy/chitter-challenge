require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # need to show peeps on the homepage
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:homepage)
  end

  get '/register' do
    return erb(:register)

  end

  post '/' do # once user has registered
    if params[:email_address].nil? || params[:username].nil? || params[:password].nil?
      status 400
      return '' 
    end

    repo = UserRepository.new
    user = User.new
    user.email_address = params[:email_address]
    user.username = params[:username]
    user.password = params[:password]
    repo.create(user)

    redirect '/'
  end
end
