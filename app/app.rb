require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :welcome_page
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    redirect to '/chitter'
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/chitter' do
    erb :homepage
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
