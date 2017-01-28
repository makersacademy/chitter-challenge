ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class App < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'

helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb:'peeps'
  end

  get '/sign_up' do
    erb:'sign_up'
  end

  post '/sign_up' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if user.save
    redirect '/log_in'
    else
    redirect '/sign_up'
    end
  end

  get '/log_in' do
    erb:'log_in'
  end

  post '/log_in' do
    session[:user_id] = user.id

    redirect '/peeps/logged_in'
  end

  get '/peeps/logged_in' do

    erb:'peeps_logged_in'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
