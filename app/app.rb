require 'sinatra/base'
require_relative 'datamapper_setup'

class ChitterChatter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                username: params[:username])
    session[:user_id] = user.id
    redirect to '/'
  end

  get '/log-in' do
    erb :log_in
  end

end
