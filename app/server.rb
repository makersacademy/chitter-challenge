require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'time'
require './app/model/cheets'
require './app/model/user'
require_relative 'data_mapper_setup'
require_relative 'controller/cheets'
require_relative 'controller/user'
require_relative 'controller/index'
require_relative 'controller/helper'
require_relative 'controller/sessions'

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, '..', "public") }
  set :views, Proc.new { File.join(root, "views") }
  set :root, File.dirname(__FILE__)

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

end
