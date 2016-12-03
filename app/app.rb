ENV["RACK_ENV"]||="development"
require 'sinatra/base'
require './app/models/user.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-info' do
    User.create(name: params[:name], username: params[:username],
                email: params[:email], password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
