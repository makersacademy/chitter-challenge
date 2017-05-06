ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
$LOAD_PATH << "#{Dir.pwd}"
require 'app/data_mapper_setup'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user_sign_up' do
    erb :user_sign_up
  end

  post '/create_user' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.last(session[:id])
    erb :welcome
  end

  get '/user_log_in' do
    erb :user_log_in
  end

  post '/user_log_in' do
    @user = User.get
    redirect '/welcome'
  end

  run! if app_file == $0

end
