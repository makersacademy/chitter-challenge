$VERBOSE=nil
ENV["RACK_ENV"] ||= 'development'

require './app/models/helper'
require './app/models/user'
require 'sinatra/partial'
require 'sinatra/base'

require_relative 'controllers/salutations'
require_relative 'controllers/sessions'
require_relative 'controllers/enter'


class Chitter < Sinatra::Base

  set :partial_template_engine, :erb

  use Rack::MethodOverride
  register Sinatra::Partial
  enable :sessions

  get '/' do
    erb :index
  end

end
