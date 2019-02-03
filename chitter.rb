require 'sinatra/base'
require 'sinatra/flash'
require './app/models/db_connection'
require './app/models/email'
require './app/models/password'
require './app/models/peep'
require './app/models/user'



class Chitter < Sinatra::Base

  ENV['RAILS_ENV'] ||= 'development'
  register Sinatra::Flash
  DatabaseConnection.setup
  enable :sessions, :method_override

  get '/' do
    @username = session[:username]
    @peeps = Peep.joins(:user).select("peeps.*, users.username, users.forename, users.surname")
    erb :index
  end

  post '/' do
    Peep.create_peep(params[:message], session[:username])
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
    redirect '/login' unless Password.check_password(params[:username], params[:password])
    session[:username] = params[:username]
    redirect '/'
  end

  get '/signup' do
    @username = session[:username]
    erb :signup
  end

  post '/signup' do
    newuser = User.create(username: params[:username],
                          forename: params[:forename],
                          surname: params[:surname],
                          email: params[:email],
                          password: Password.hash(params[:password]))
    if newuser.errors.any?
      flash[:error] = newuser.errors.full_messages.first
      redirect '/signup'
    end
    session[:username] = params[:username]
    redirect '/'
  end

end
