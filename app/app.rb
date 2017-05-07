ENV['RACK_ENV'] = 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       username: params[:username])
    session[:user_id] = user.id
    redirect ('/index')
  end



end
