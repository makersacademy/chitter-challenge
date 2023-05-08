require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/chitter_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/chitter_repository'
  end

  get '/' do
    return erb(:index)
  end

  get '/about' do
    return erb(:about)
  end

  get '/chitters' do
    repo = ChitterRepository.new
    @chitters = repo.all

    return erb(:chitters)
  end

  post '/chitters' do
    repo = ChitterRepository.new
    chitter = Chitter.new

    chitter.peep = params[:peep]
    chitter.created_at = Time.now
    repo.create(chitter)

    @new_chitter = params[:peep]

    return erb(:chitter_created)
  end

  get '/chitters/new' do
    return erb(:new_chitter)
  end
  
  get '/users' do
    repo = UserRepository.new
    @users = repo.all

    return erb(:users)
  end

  get '/sign-up' do
    return erb(:new_user)
  end

  post '/sign-up' do
    repo = UserRepository.new
    user = User.new

    user.email = params[:email]
    user.password = params[:password]
    user.name = params[:name]
    user.username = params[:username]
    repo.create(user)

    @new_user = params[:username]

    return erb(:user_created)
  end

  get '/chitters/new' do
    return erb(:new_chitter)
  end
end