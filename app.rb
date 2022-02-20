require 'sinatra'
require "sinatra/reloader" if development?
require './lib/user'
require './lib/chitter'

class ChitterManager < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  
  get '/' do
    @chitter = Chitter.all
    erb :'index'
  end

  post '/new' do
    erb :'new'
  end

  post '/createuser' do
    @user_email = params[:email]
    @first_name = params[:first_name]
    session[:message] = [@user_email, params[:first_name]]
    User.create(first_name: params[:first_name], last_name: params[:last_name], user_email: params[:email], user_password: params[:password], user_name: params[:user_name])  
    @chitter = Chitter.all
    erb :'registered'
  end

  get '/createchitter' do
    session_data = session[:message]
    @user_email = session_data[0]
    @first_name =  session_data[1]
    @chitter = Chitter.create(peep: params[:peep], user_email: @user_email) 
    @chitter = Chitter.all
    erb :'registered'
  end

  get '/quit' do
    session[:message] = nil
    redirect '/'
  end

  # (do not change the line below)
  run! if app_file == $0

end