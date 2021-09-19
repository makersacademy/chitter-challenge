require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/chitter.rb'
require_relative '../lib/users.rb'
require_relative '../db/queries/pg_connect.rb'

class ChitterApp < Sinatra::Base

  set :public_folder, 'public'
  enable :sessions

  include Postgres

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    connect
    erb :index
  end

  get '/home' do
    session[:error] = ""
    @user = User.get(session[:user_id])
    redirect '/' if @user.nil?
    @messages = Chitter.show_all_messages
    erb :messages
  end

  post '/add-message' do
    Chitter.create_message(message: params["post-message"],user_id: session[:user_id])
    redirect '/home'
  end

  get '/users/signup' do
    erb :signup
  end

  post '/users/signup' do
    user = User.add(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/users/signin' do
    @error = session[:error]
    erb :signin
  end

  post '/users/signin' do
    user = User.auth(email: params[:email], password: params[:password])
    session[:error] = ""
    if user
      session[:user_id] = user.id
      redirect('/home')
    else
      session[:error] = 'Incorrect email or password - Please try again'
      redirect('/users/signin')
    end
  end

  post '/logout' do
    session.clear
    redirect('/')
  end

  run! if app_file == $0
end
