require 'sinatra/base'
require './lib/user'


class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
      User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      psw: params[:psw]
    )
    redirect '/chitter'
  end

  get '/chitter' do
    @current_user
    erb :chitter
  end

  run! if app_file == $0
end
