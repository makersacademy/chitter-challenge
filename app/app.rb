ENV["Rack_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/home' do
    @current_user = session[:user_id]
    erb :home_page

  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.name
    redirect '/home'
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
