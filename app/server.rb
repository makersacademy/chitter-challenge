require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

require './app/helpers/current_user'

class Chitter < Sinatra::Base
  enable :sessions

  include CurrentUser

  get '/' do
    erb :index
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  post '/users/sign_in' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/'
  end

  get '/users/sign_out' do
    session[:user_id] = nil
    redirect to '/'
  end

end
