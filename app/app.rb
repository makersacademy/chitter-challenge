ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/users/new' do
    erb :signup
  end

  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email],
            password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      redirect('/session')
    else
      flash[:errors] = user.errors.full_messages
      redirect('users/new')
    end
  end

  get '/session' do
    erb :session
  end


end
