ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './modles/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello Chitter!'
  end

  get '/user/signup' do
    erb :sign_up
  end

  post '/user' do
    User.create(first_name: params[:first_name],
                surname: params[:surname],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect to('/welcome')
  end

  get '/welcome' do
    @username = session[:username]
    erb :welcome
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
