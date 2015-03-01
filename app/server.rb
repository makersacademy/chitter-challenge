require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './app/model/peeps'
require './app/model/user'
require_relative 'data_mapper_setup'
require_relative 'controller/peeps'
require_relative 'controller/user'
require_relative 'controller/sessions'
require_relative 'controller/index'
require_relative 'controller/helper'


class ChitterApp < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  set :root, File.dirname(__FILE__)

  enable :sessions
  set :session_secret, 'my unique encryption key!'
  use Rack::Flash
  use Rack::MethodOverride

end