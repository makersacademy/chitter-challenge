require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user'


class Chitter < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      "User saved"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
