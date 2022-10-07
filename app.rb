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
    erb :index
  end

  get '/user' do
    erb :user
  end

  post '/login' do
    user = User.new(params[:username], params[:password], params[:name], params[:email])
    repo = UserRepository.new
    repo.create(user)
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