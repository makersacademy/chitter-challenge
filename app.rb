require 'sinatra/base'
require './lib/user'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/chitter' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    @username = User.username
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  run! if app_file == $0
end
