require 'sinatra/base'
require_relative '../data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'


  get '/' do
    'Hello Chitter!'
  end


      def current_user
        @current_user ||= User.get(session[:user_id])
      end


  get '/sign_up' do
    erb :'user/sign_up'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password],name: params[:name], nickname: params[:nickname])
    redirect '/peeps'
    end

    get '/peeps' do
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
