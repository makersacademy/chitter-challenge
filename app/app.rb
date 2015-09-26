require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class ChitterWeb < Sinatra::Base

  get '/' do
    'hello world'
  end

  get '/users/new' do
    erb :'new_users'
  end

  post 'users/new' do
    User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password])
    redirect to('/')
  end



run! if app_file == $0
end
