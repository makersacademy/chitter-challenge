require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require 'pry'
require 'data_mapper'
require_relative 'chitter'

class Controller < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  Chitter.connect

  get '/' do
    redirect to '/login'
  end

  get '/login' do
    erb :login
  end

  post '/signup' do
    if params[:email].length == 0 or params[:password].length == 0
      flash[:login_message] = "Please signup with a valid email/password"
      redirect '/login'
    end
    p params
    Chitter.create_user(User.new(nil, params[:email], params[:password], params[:name], params[:username]))
    redirect '/cheets'
  end

  get '/cheets' do
    erb :cheeter
  end

  post '/add_cheet' do
    if params[:content].length < 1
      flash[:message] = "The tweet is too short."
    elsif params[:content].length >= 240
      flash[:message] = "The tweet is too long. Ensure tweet < 240 characters"
    else
      flash[:message] = "The tweet was successfully added."
      Chitter.add(Chit.new(params[:content]))
    end
    redirect '/cheets'
  end

  run if $app_file == 0

end
