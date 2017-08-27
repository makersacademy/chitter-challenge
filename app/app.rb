require_relative './data_mapper_setup'
require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/homepage' do
    erb(:homepage)
  end

  post '/signup' do
    erb(:signup)
  end

  post '/welcome' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/feed'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/feed' do
    erb(:index)
  end

  post '/new' do
    Message.create(body: params[:body], name: params[:name])
    redirect '/feed'
  end

end
