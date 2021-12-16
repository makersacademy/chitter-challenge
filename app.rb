require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './docs/chitter'
require './docs/user'
require './docs/peep'
require "pg"
require "./database_connection_setup"

class Chitter_app < Sinatra::Base
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  use Rack::MethodOverride

  get '/' do
    # @user = User.find(id: session[:user_id])
    # @peep_log = Peep.all
    erb :index
  end

  post '/login/option' do
    login_choice = params[:login_choice]
    if login_choice == "Register"
      redirect '/users/register'
    elsif login_choice == "Log in"
      redirect '/users/login'
    end
  end

  get '/users/login' do
    Chitter.post(time: Time.now, message: params[:peep])
    erb :"users/login"
  end

  get '/users/register' do
    erb :"users/register"
  end

  # post "peep/new" do
  #   Chitter.post(time: Time.now, message: params[:peep])
  #   redirect "/"
  # end

  # post '/chitter' do 
  #   @user = User.find(id: session[:user_id])
  #   Chitter.create(post: params['post'], author_id: session[:user_id], author_email: @user_email, author_name: @user.name)
  #   # @user_email = @user.email
  #   redirect '/chitter'
  # end

  # get '/users/new' do
  #   erb :"users/new", :layout => :main_layout
  # end

  # post '/users' do
  #   user = User.create(name: params[:name], email: params[:email], password: params[:password])
  #   session[:user_id] = user.id
  #   redirect '/chitter'
  # end

  
    # get '/chitter' do
    #   @user = User.find(id: session[:user_id])
    #   @chitter = Chitter.all
    #   erb :chitter, :layout => :main_layout
    # end 
  
    # get '/chitter/new' do 
    #   @user = User.find(id: session[:user_id])
    #   erb :new, :layout => :main_layout
    # end 
  





  # get "/register" do
  #   erb :"chitter/users/register"
  # end

  # post "/users" do
  #   user = User.create(email: params[:email], password: params[:password])
  #   session[:user_id] = user.id
  #   redirect "/chitter"
  # end

  # get "/chitter/sessions/new" do
  #   erb :"chitter/sessions/new"
  # end

  # post "/sessions" do
  #   user = User.authenticate(email: params[:email], password: params[:password])
  #   session[:user_id] = user.id
  #   redirect "/chitter"
  # end

  run! if app_file == $0
end
