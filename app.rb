require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/helpers'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    @user = process_signup_details
    session[:user_id] = @user.id
    session[:username] = @user.username
    erb(:signup_success)
  end

  get '/signin' do
    erb(:signin_form)
  end

  post '/signin' do
    valid_user = process_signin_details(params[:username], params[:password])
    if valid_user
      session[:user_id] = valid_user.id
      session[:username] = valid_user.username
      redirect '/feed'
    end
  end

  get '/feed' do
    @peeps = PeepRepository.new.all
    erb(:feed)
  end

  post '/feed' do
    peep = process_peep
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
    session.clear
    redirect '/feed'
  end

end
