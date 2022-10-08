require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'

DatabaseConnection.connect('chitter_test')
class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    @all_peeps = peep_repo.all_with_usernames
    erb :index
  end

  get '/user' do
    peep_repo = PeepRepository.new
    @all_peeps = peep_repo.all_with_usernames
    erb :user
  end

  post '/login' do
    repo = UserRepository.new
    new_user = User.new(params[:username], params[:password])
    
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
    peep = Peep.new(params[:content], 0, params[:user_id])
    peep_repo.create(peep)
    redirect to('/user')
  end
end