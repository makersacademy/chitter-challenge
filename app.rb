ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'lib', 'data_mapper_setup.rb')
require File.join(File.dirname(__FILE__), 'lib', 'user.rb')

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super-secret'

  get '/' do
    redirect '/sign-up'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new-user' do
    user = User.create(email_address: 	params[:email_address],
                       password: 	params[:password],
                       user_name: 	params[:user_name],
                       real_name: 	params[:real_name])
    session[:user_id] = user.id
    redirect '/chitter-newsfeed'
  end

  get '/chitter-newsfeed' do
    erb :newsfeed
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in' do
    if User.authenticate(email_address: params[:email_address], password: params[:password])
      session[:user_id] = User.first(email_address: params[:email_address]).id
      redirect '/chitter-newsfeed'
    else
      redirect '/log-in'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end

end
