require 'sinatra/base'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    # session[:message] = "Successfully stored your login information"
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  run! if app_file == $0
end
