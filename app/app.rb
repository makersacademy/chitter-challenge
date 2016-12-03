require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    user = User.create(email: params[:email], pass: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/posts'
  end

  get '/posts' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
