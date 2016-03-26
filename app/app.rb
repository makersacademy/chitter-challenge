ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  USERS = []

  get '/' do
    erb :index
  end

    get '/users/new' do
     # @user = User.new
     erb :'/users/new'
    end


  post '/signup' do
      @user = User.new(name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
     )
      @user.save
    # "welcome #{params['email']}"
    # else
    #   if User.find params[:email]
    #     "welcome #{params['email']}"
    #   else
    #     'Sorry, you have not signed up'
    #   end
    # # end
    redirect '/'
  end


    run! if app_file == $0

end
