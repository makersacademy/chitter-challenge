
ENV["RACK_ENV"] ||= "development" # ensures app runs in development mode by default

require 'sinatra/base'
require './models/data_mapper_setup'

class ChitterChallenge < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password])
  session[:user_id] = @user_id
  redirect to('/session/account')
end

get '/session/account' do

  erb :'session/account'
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
