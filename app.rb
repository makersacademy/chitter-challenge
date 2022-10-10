require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'

DatabaseConnection.connect
class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    @all_peeps = peep_repo.all_with_usernames
    erb :index
  end

  get '/user' do
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    @all_peeps = peep_repo.all_with_usernames
    @name = session[:name]
    session[:user_id] = user_repo.get_user_id(session[:name])
    erb :user
  end

  post '/login' do
    repo = UserRepository.new
    new_user = User.new(params[:username], params[:password])
    session[:name] = params[:username]
    # I need to store the userID in a session eventually.
    # Perhaps need to create a method that converts username to id.
     if repo.login?(new_user)
      redirect to ('/user')
     else
      redirect to ('/')
     end
  end

  post '/user/new' do
    user_repo = UserRepository.new
    user = User.new(params[:username], params[:password], params[:name], params[:email])
    user_repo.create(user)
    redirect to('/user')
  end

  post '/peep/new' do
    peep_repo = PeepRepository.new
    peep = Peep.new(params[:content], 0, session[:user_id])
    peep_repo.create(peep)
    redirect to('/user')
  end
end