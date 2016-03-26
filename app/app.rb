require 'byebug'
require 'sinatra'
require 'data_mapper'
require 'pry'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Application

  USERS = []

  get '/' do
    erb :index
  end

  post '/signup' do
    # if params[:signup]
    # User.create email: params[:email]
    "welcome #{params['email']}"
    # else
    #   if User.find params[:email]
    #     "welcome #{params['email']}"
    #   else
    #     'Sorry, you have not signed up'
    #   end
    # end
  end

end
