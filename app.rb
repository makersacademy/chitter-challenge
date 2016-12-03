ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/user.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :sign_up
  end

  post '/sign_up_complete' do
    if params[:password] == params[:password_confirmation]
      user = User.create(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      redirect to('/')
    end
  end

  get 'chitter' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
