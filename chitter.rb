require 'sinatra/base'
require 'sinatra/flash'
require './app/models/db_connection'
require './app/models/email'
require './app/models/password'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    ENV['RAILS_ENV'] ||= 'development'
    @username = session[:username]
    @peeps = Peep.joins(:user).select("peeps.*, users.username, users.forename, users.surname")
    erb :index
  end

  post '/' do
    user_id = User.find_by(username: session[:username]).id
    Peep.create(message: params[:message], user_id: user_id)
    redirect '/'
  end

  get '/new' do
    @username = session[:username]
    erb :new
  end

  get '/login' do
    @username = session[:username]
    flash[:failure] = "Invalid username or password. Try again"
    erb :login
  end

  get '/logout' do
    session[:username] = nil
    redirect '/'
  end

  post '/login' do
    @result = Password.check_password(params[:username], params[:password])
    redirect '/login' if @result == false
    session[:username] = params[:username]
    redirect '/'
  end

  get '/signup' do
    @username = session[:username]
    erb :signup
  end

  post '/signup' do
    encrypted = Password.hash(params[:password])
    newuser = User.create(username: params[:username],
                          forename: params[:forename],
                          surname: params[:surname],
                          email: params[:email],
                          password: encrypted)
    if newuser.errors.any?
      flash[:error] = newuser.errors.full_messages.first
      redirect '/signup'
    end
    session[:username] = params[:username]
    redirect '/'
  end

  DatabaseConnection.setup

end
