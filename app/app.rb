ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base
  register

  get '/' do
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = {name: params[:name], handle: params[:handle], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]}
    erb :'/users/welcome'
  end


end
