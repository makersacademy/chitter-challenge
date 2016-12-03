ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/user'
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/users' do
    @user = User.create(email: params[:email], name: params[:name], password: params[:password], nickname: params[:nickname])
    @users = User.all
    erb :user
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
