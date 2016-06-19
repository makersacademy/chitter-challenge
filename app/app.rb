ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'models/user'
require_relative'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  register Sinatra::Flash

 get '/' do
   redirect '/peeps'
 end

 get '/peeps' do
   @peeps = Peep.all
   erb :'peeps/index'
 end

 get '/peeps/new' do
   erb :'peeps/new'
 end

 post '/peeps' do
   time = Time.now
   Peep.create(text: params[:text], time: time)
   redirect '/peeps'
 end

 get '/users/new' do
   @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/peeps')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'goodbye!'
  redirect to '/peeps'
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

 run! if app_file == $0
end
