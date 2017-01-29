ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'index'
  end

  get '/signup' do
    erb :'sign_up'
  end

  post '/registration' do
    user= User.create(name: params[:name],
                  username: params[:username],
                  email: params[:email],
                  password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/peeps' do
    erb :'peeps'
  end

end


  Chitter.run! if $0 == 'app/app.rb'
