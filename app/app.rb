ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'rubygems'
require 'tilt/erb'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'woobly-doobly'

  get '/' do
    erb(:index)
  end

  post '/users/new' do

    user = User.create(full_name:             params[:full_name],
                       username:              params[:username],
                       email:                 params[:email],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      erb(:'users/new')
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
