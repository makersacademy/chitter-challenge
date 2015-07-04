require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hi'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(
      email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation']
    )
    redirect '/'
  end
end
