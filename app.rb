ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require File.join(File.dirname(__FILE__), 'lib', 'data_mapper_setup.rb')
require File.join(File.dirname(__FILE__), 'lib', 'user.rb')

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super-secret'

  register Sinatra::Flash

  register Sinatra::Partial
  set :partial_template_engine, :erb

  get '/' do
    redirect '/users/new'
  end

  get '/chitter-newsfeed' do
    erb :newsfeed
  end

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end

end
require_relative 'controllers/users.rb'
require_relative 'controllers/sessions.rb'
