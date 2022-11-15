require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/user_repository'
require './lib/user'
require './lib/peep_repository'
require './lib/peep'

DatabaseConnection.connect('chitter_challenge')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  
  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all

    return erb :index, :layout => :main_layout if session[:user_id].nil?
    return erb :index, :layout => :main_layout
  end

  get '/login' do
    return erb :login if session[:user_id].nil?
    redirect '/'
  end

  post '/login' do
    repo = UserRepository.new
    user = repo.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    return erb :signup if session[:user_id].nil?
    redirect '/'
  end

  post '/signup' do
    repo = UserRepository.new
    user = User.new
    user.email = params[:email]
    user.username = params[:username]
    user.password = params[:password]
    user.name = params[:name]
    user = repo.create(user)
    session[:user_id] = user.id
    redirect '/'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/peeps/new' do
    return erb :login if session[:user_id].nil?
    erb :new_peep
  end

  post '/peeps/new' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.user_id = session[:user_id]
    peep.content = params[:content]
    peep.post_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    repo.create(peep)

    @peep = peep.post_time

    redirect '/'
  end
end
