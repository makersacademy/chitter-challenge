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
    User.create(name:  params[:name],  username: params[:username],
                email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in-info' do
    current_user = User.all(email: params[:email])
    current_user.size == 0 ? error = "You haven't signed up yet!" : redirect('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
