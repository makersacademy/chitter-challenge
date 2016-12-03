require 'sinatra/base'
require_relative 'models/user.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/' do
    user = User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
