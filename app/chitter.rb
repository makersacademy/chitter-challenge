ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/data_mapper_setup'
require './app/controllers/users.rb'

class Chitter < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    @current_user = current_user
    erb :root_page
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
