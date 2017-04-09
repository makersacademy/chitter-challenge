require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
  user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/peeps/peeps')
  end

  get '/peeps/peeps' do
    erb :'peeps/peeps'
  end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

end
