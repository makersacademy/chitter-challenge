require './lib/database_connection'
require 'sinatra'
require "sinatra/reloader"
require './lib/peeprepository'
require './lib/peep'
require './lib/user'
require './lib/userrepository'

DatabaseConnection.connect

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:all_peeps)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  post '/peeps' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    new_peep.user_id = params[:user_id]
    repo.create(new_peep)

    @peeps = repo.all
    return erb(:all_peeps)
  end

  get '/' do
    return erb(:index)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.name = params[:name]
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)

    return erb(:index)
  end
end
