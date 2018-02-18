ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/comment'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'date'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.get(session[:user_id])
    @comments = Comment.all
    erb :index
  end

  post '/new' do
    Comment.create(comment: params[:message])
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    flash.next[:success] = 'Sign up successful!'
    redirect '/'
  end

end
