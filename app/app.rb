require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/signup' do
    erb(:signup)
  end

  post '/' do
    User.create(username: params[:username], password: params[:password])
  end

  run! if app_file == $0
end