require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base

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
     flash.now[:notice] = "Password and confirmation password do not match"
     erb :'users/new'
   end
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
