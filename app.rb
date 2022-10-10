require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/chitter' do
    erb (:sign_up)
  end

  post '/chitter' do

    repo = UserRepository.new
    new_user = User.new

    new_user.username = params[:username]
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]

    repo.create(new_user)
    @username = params[:username]

    return erb (:user_created)
  end

    get '/chitter/home' do
        repo = PeepRepository.new

        @peeps = repo.all
        
        return erb(:chitter_home)
    end
end