require 'date'
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repo'
require_relative 'lib/user_repo'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peeps
  end

  post '/' do
    return erb(:login) if session[:user_id].nil?
    repo = PeepRepo.new
    peep = Peep.new
    peep.message = params['peep']
    peep.time = DateTime.now
    peep.user_account_id = 1
    repo.create(peep)
    peeps
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.password = params[:password]
    new_user.email_address = params[:email]
    new_user.name = params[:name]
    ult = repo.create(new_user)
    return erb(:login) if ult == false
    return erb(:signup)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    username = params[:username]
    password = params[:password]
    user = UserRepo.new.find_by_username(username)
    return erb(:login) unless user.password == password
    session[:user_id] = user.id
    peeps
  end

  get '/logout' do
    session[:user_id] = nil
    peeps
  end

  private

  def peeps
    @session = session[:user_id]
    @peeps = PeepRepo.new.all.reverse
    return erb(:index)
  end

  def new_user

  end
end
