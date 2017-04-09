require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
  @user = User.new
  erb :'users/new'
end

  post '/users' do
  @user = User.new(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
    if @user.save
     session[:user_id] = @user.id
     redirect to('/peeps/peeps')
   else
     flash.now[:errors] = @user.errors.full_messages
     erb :'users/new'
   end
end

  get '/peeps/peeps' do
    erb :'peeps/peeps'
  end

  get '/sessions/new' do
  erb :'sessions/new'
  end

  post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/peeps/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
  end

  delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'Goodbye!'
  redirect to '/peeps/peeps'
end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

end
