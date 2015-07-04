require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    user = User.first id: session['user_id']
    "Welcome, #{user.email}"
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(
      email:                 params['email'],
      password:              params['password'],
      password_confirmation: params['password_confirmation']
    )
    if user.save
      session['user_id'] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end
end
