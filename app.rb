require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/helpers'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    redirect '/feed'
  end

  get '/signup' do
    erb(:signup_form)
  end

  post '/signup' do
    @user = process_user_details
    repo = UserRepository.new
    repo.signup(@user)
    valid_user = repo.check_valid_user(@user.username, @user.password)
    if valid_user
      session[:user_id] = valid_user.id
      session[:username] = valid_user.username
      erb(:signup_success)
    end
  end

  get '/signin' do
    erb(:signin_form)
  end

  post '/signin' do
    repo = UserRepository.new
    username = params[:username]
    password = params[:password]
    valid_user = repo.check_valid_user(username, password)
    if valid_user
      session[:user_id] = valid_user.id
      session[:username] = valid_user.username
      redirect '/feed'
    else
      erb(:signin_form)
    end
  end

  get '/feed' do
    @peeps = PeepRepository.new.all
    erb(:feed)
  end

  post '/feed' do
    peep = construct_peep
    repo = PeepRepository.new
    repo.create(peep)
    @peeps = repo.all
    erb(:feed)
  end

  get '/users/:username' do
    @user = UserRepository.new.find_by_username(params[:username])
    @peeps = PeepRepository.new.find_by_user(@user.id)
    erb(:profile)
  end

  get '/logout' do
    session[:user_id] = nil
    session[:username] = nil
    redirect '/feed'
  end

end
