ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 4000000
  set :session_secret, 'super secret'

  get '/home' do
    @current_user
    erb :home
  end


  get '/home/sign-up' do
    erb :signup
  end

  post '/home/sign-up' do
    user = User.create(email: params[:email],
    password: params[:password],
    password_confirmation: params[:confirm_password])
    session[:user_id] = user.id
    redirect '/home'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
