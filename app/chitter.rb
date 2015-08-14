require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Hello Chitter!'
  end

  get '/user/new' do
  	erb :sign_up
  end

  post '/user/new' do
  	@user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
  	erb :sign_up
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
