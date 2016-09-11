ENV["RACK_ENV"]  ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base
  get '/' do
    'Hello ChitterApp!'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/timeline'
  end

  get '/timeline' do
    erb :timeline
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
