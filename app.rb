require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.instance
    erb :index
  end

  get '/sign-up' do
    erb :signup
  end

  post '/welcome' do
    User.create(params[:name], params[:handle], params[:password], params[:email])
    erb :welcome
  end

  run! if app_file == $0
end
