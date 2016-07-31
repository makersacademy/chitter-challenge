require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'


class Chitter < Sinatra::Base

  enable :sessions

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user' do
    User.create(username: params[:username],
                   email: params[:email],
                password: params[:password])
    redirect('/')
  end

  get '/user' do
    'Welcome, user'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
