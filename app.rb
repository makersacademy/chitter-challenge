require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup_form)
  end

  post '/signup' do
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    UserRepository.new.create(@user)
    erb(:signup_success)
  end

  get '/feed' do
    @peeps = PeepRepository.new 
    erb(:feed)
  end

  post '/feed' do
    @peep = Peep.new
    @peep.content = params[:content]
    @peep.timestamp = params[:timestamp]
    @peep.user_id = params[:user_id]
    PeepRepository.new.create(@peep)
    erb(:peep_posted)
  end
end
