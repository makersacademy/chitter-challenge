ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super_secret'

  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @user_name = session[:user_name]
    erb(:feed)
  end


  get '/user/sign_up' do
    erb(:'user/sign_up')
  end

  post '/user/sign_up' do
    @user = User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    session[:user_name] = @user.user_name
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
