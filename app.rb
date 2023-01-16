require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'lib/peep'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    if logged_in?
      @username = User.find(session[:user_id]).username
    end
    @peeps = Peep.order('created_at DESC')
    return erb(:index)
  end

  post '/add_peep' do
    if params[:content].empty?
      flash[:failed_peep] = 'Please enter a peep!'
      redirect '/'
    else
      peep = Peep.new("content": params[:content], "user_id": session[:user_id])
      peep.save ? (redirect "/") : "Failed to create a post!"
    end
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    # user authentication
    if User.find_by(username: params[:username])&.authenticate(params[:password])
      # logged in
      session[:user_id] = User.find_by(username: params[:username]).id
      redirect '/'
    else
      # wrong credentials
      flash[:failed_login] = 'Incorrect username or password 😖'
      erb(:login)
    end
  end

  get '/logout' do
    # kill the session and redirect to the homepage
    session.clear
    redirect '/'
  end

  get '/register' do
    # render the register view
    return erb(:register)
  end

  post '/register' do
    # add user credentials to the database
    user = User.new(
      "username": params[:username],
      "name": params[:name],
      "email": params[:email],
      "password": params[:password]
    )
    # add user to db
    user.save ? (redirect "/") : "Failed to add user!"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
end