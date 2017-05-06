ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Homepage'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end
end
