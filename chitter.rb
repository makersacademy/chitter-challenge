require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './app/models/peep'
require './app/models/user'
require './app/models/db_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    ENV['RAILS_ENV'] = 'development' if ENV['RAILS_ENV'] != 'test'
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message], user: 1)
    redirect '/'
  end

  get '/login' do
    flash[:failure] = "Invalid username or password. Try again"
    erb :login
  end

  get '/logout' do
    User.logged_in_user(nil)
    redirect '/'
  end

  post '/loginresult' do
    @result = User.check_password(params[:username], params[:password])
    redirect '/login' if @result == nil
    User.logged_in_user(params[:username])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signupresult' do
    encrypted = BCrypt::Password.create(params[:password])
    User.create(username: params[:username], forename: params[:forename] ,surname: params[:surname], email: params[:email], password: encrypted)
    User.logged_in_user(params[:username])
    redirect '/'
  end

 DatabaseConnection.setup
 User.logged_in_user(nil)

end
