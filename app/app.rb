ENV['RACK_ENV']||='development'
require 'sinatra/base'
require_relative  './models/user.rb'
require_relative './models/database_setting.rb'
require 'dm-core'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  helpers do
    def current_user
      User.first(id: session[:id])
    end
  end


  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    erb :sign_up

  end

  post '/new_user' do
    user = User.create(name: params[:name], user_name: params[:user_name],
                        email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect '/chitter'
  end

  get '/chitter' do
    @user = current_user
    erb :chitter
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
