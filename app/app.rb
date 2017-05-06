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

  run! if app_file == $0

end
