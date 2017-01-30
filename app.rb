ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do
      def current_user
        @current_user ||= User.get(session[:id])
      end
    end
  get '/' do
    erb :signup
  end

  post '/welcome' do
    @name = params[:name]
    user = User.create(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  post '/user/page' do
    session[:id] = User.first(email: params[:email]).id
    @user = current_user
    erb :userpage
  end

  post '/peeps' do
    # @peep = Peep.create(message: params[:message])
    current_user.peeps << Peep.create(message: params[:message], user: current_user.username)
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0

end
