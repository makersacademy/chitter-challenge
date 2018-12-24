require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps'
require './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @name = session[:forename]
    erb :index
  end

  get '/chitter/messaging' do
    user = session[:username]
    if user.nil?
      flash[:error] = "You have to be signed in to post a message."
      redirect "/"
    end
    erb :"chitter/messaging"
  end

  post '/messaging' do
    Peeps.create(params[:message])
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @peep = Peeps.read
    erb :"chitter/feed"
  end

  post '/chitter/feed' do
    @peep = Peeps.read(params[:sort_by])
    erb :"chitter/feed"
  end

  get '/chitter/sign_up' do
    erb :"chitter/sign_up"
  end

  post '/chitter/sign_up' do
    begin
    Users.create(params[:username], params[:password], params[:email],
                 params[:forename], params[:surname])
    name = params[:forename]
    session[:username] = params[:username]
    flash[:success] = "Success, welcome to Chitter #{name}"
    redirect '/chitter/sign_up'
    rescue PG::UniqueViolation
      flash[:error] = "Sorry, that username is already taken. Please try again"
      redirect '/chitter/sign_up'
    end
    erb :"chitter/sign_up"
  end

  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    if Users.login(params[:username], params[:password])
      session[:username] = params[:username]
      session[:forename] = params[:forename]
      name = session[:username]
      flash[:success] = "Welcome back #{name}!!"
      redirect :"/chitter/feed"
    else
      flash[:error] = "Username or password was incorrect or you have not signed up"
      redirect :"/index"
    end
  end

  get '/sessions/destroy' do
    session.clear
    flash[:error] = 'You have signed out'
    redirect '/'
  end

  run! if app_file == $0
end
