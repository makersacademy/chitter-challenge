ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/user'
require 'tilt/erb'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:'users/new')
  end

  get '/users/new' do
    User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect('/peeps/index')
  end

  get '/peeps/index' do
    erb(:'peeps/index')
  end
end
