ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users/sign_up' do
    User.create(username: params[:username],
                email: params[:email],
                password: params[:password],
                #password_confirmation: params[:password_confirmation]
               )
    redirect '/peeps/feed'
  end

  get '/peeps/feed' do
    erb :'peeps/feed'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
