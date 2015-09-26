require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base 

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]  
    end
  end

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
