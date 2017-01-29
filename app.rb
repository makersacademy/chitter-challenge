ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    redirect '/timeline'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username])
    session[:username] = user.username
    redirect '/timeline'
  end

  get '/timeline' do
    @username = session[:username]
    erb :timeline
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
