require 'sinatra/base'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/user'
require_relative 'lib/peep_repository'
require_relative 'lib/peep'


DatabaseConnection.connect


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    user_repo = UserRepository.new
    repo = PeepRepository.new
    @peeps = repo.all.reverse
    if !session[:user_id].nil?
      user_id = session[:user_id]
      @user = user_repo.find(user_id)
    end
      return erb :peeps, :layout => :main_layout
  end

  post '/' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.name = params[:name]
    peep.username = params[:username]
    peep.content = params[:content]
    peep.time = Time.now.getutc
    repo.create(peep)
    redirect "/"
  end

  get '/signup' do
    if session[:user_id].nil?
      return erb :signup, :layout => :main_layout
    else
      redirect '/'
    end
  end

  post '/signup' do
    if session[:user_id].nil?
      repo = UserRepository.new
      user = User.new
      user.username = params[:username]
      user.name = params[:name]
      user.email = params[:email]
      user.password = params[:password]
      user = repo.create(user)
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/'
    end
  end


  get '/sessions/login' do
    if session[:user_id].nil?
      return erb :login
    else
      redirect '/'
    end
  end

  post '/sessions/login' do
    repo = UserRepository.new
    user = repo.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/sessions/login'
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end


end