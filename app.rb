require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(name: params[:name], username: params[:username], email: params[:email], psw: params[:psw])
    @username = User.username
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  run! if app_file == $0
end
