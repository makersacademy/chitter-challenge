require 'sinatra/base'
require './lib/message.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/home' do
    @messages = Message.all
    erb :home
  end

  post '/new_message' do
    Message.create(
      username: params[:username],
      msg: params[:message],
      created_on: DateTime.now.new_offset(0)
    )
    redirect '/home'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if params[:password] != params[:password_confirmation]
      @error = 'Passwords do not match'
      return erb :error
    end

    success = User.signup(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect '/home' if success

    @error = 'Username already exists'
    erb :error
  end
end
