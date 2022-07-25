require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'

class ChitterController < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/flow' do
    # @user = User.find(session[:user_id])
    @id = session[:user_id]
    @messages = Message.all
    erb :"flow/index"
  end

  post '/flow' do
    p "SEE BELOW"
    p session[:user_id]
    @user_id = session[:user_id]
    Message.create(content: params[:message], user_id: @user_id)
 
    redirect '/flow'
  end

  get '/flow/new' do
    @id = session[:user_id]
    erb :"flow/new"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    p "SEE BELOW"
    p @user
    
    session[:user_id] = @user.id

    # create the user, then redirect
    redirect '/flow'
  end

  run! if app_file == $PROGRAM_NAME

end
