ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'


  get '/users/new' do #sign up
    # @user = User.new
    erb :'users/new'
  end

  post '/users' do # user goes to this page after signing up
    @user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    @user.save
    session[:user_id] = @user.id
    redirect to "/hub"
  end

  get '/hub' do
    erb :hub
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end