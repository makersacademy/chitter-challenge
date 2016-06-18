ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/user/signup' do
    erb :signup
  end

  get '/peeps' do
    @username = session[:user_username]
    erb :peeps
  end

  post '/user/signup' do
    create_new_user(params)
    start_user_session(@user)
    redirect '/peeps'  
  end


  def create_new_user(user_data)
    @user = User.create(name:     user_data[:name],
                        surname:  user_data[:surname],
                        email:    user_data[:email],
                        password: user_data[:password],
                        username: user_data[:username]
                       ) 
  end

  def start_user_session(user)
    session[:user_username] = user.username
  end

end
