require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Hello"
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user=User.new(name: params[:name],
                user_name: params[:user_name],
                email: params[:email])
    if user.save
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/user/new'
    end
  end
end