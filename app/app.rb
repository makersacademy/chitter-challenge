require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
