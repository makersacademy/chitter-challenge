require 'sinatra/base'
require_relative 'models/chitter_user'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter! please go to signup'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/users' do
    Chitter_User.create(user_email: params[:user_email], password: params[:password], user_full_name: params[:user_full_name], user_name: params[:user_name])
    redirect '/welcome'
  end

  # get '/welcome' do
  #   erb :welcome_page
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
