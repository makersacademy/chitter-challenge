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
    @peeps = Peep.joins(:user).select("peeps.*, users.*")
    erb :index
  end

  post '/' do
    p User.logged_in_name
    user_id = User.find_by(username: User.logged_in_name).id
    Peep.create(message: params[:message], user_id: user_id)
    redirect '/'
  end

  get '/new' do
    erb :new
  end

  get '/login' do
    flash[:failure] = "Invalid username or password. Try again"
    erb :login
  end

  get '/logout' do
    User.set_user(nil)
    redirect '/'
  end

  post '/login' do
    @result = User.check_password(params[:username], params[:password])
    redirect '/login' if @result == false
    User.set_user(params[:username])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    encrypted = BCrypt::Password.create(params[:password])
    newuser = User.create(username: params[:username],
                          forename: params[:forename],
                          surname: params[:surname],
                          email: params[:email],
                          password: encrypted)
    if newuser.errors.any?
      flash[:error] = newuser.errors.full_messages.first
      redirect '/signup'
    end
    User.set_user(params[:username])
    redirect '/'
  end

 DatabaseConnection.setup
 User.set_user(nil)

end
