ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user])
    end
  end

  get '/' do
    erb :index, :layout => :layout
  end

  get '/loggedin' do
    erb :loggedin, :layout => :layout
  end

  get '/new' do
    erb :new
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep_content], created_by: current_user.username)
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    session[:user] = user.id
    redirect '/loggedin'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.first(username: params[:username])
    if BCrypt::Password.new(user.password_digest) == params[:password]
      session[:user] = user.id
      redirect '/loggedin'
    else
      flash.now[:fail] = 'Password incorrect - please try again'
      erb :login
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
