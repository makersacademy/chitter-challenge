require 'sinatra/base'
require 'data_mapper'
require './lib/peep.rb'
require './lib/user.rb'
require 'rack-flash'
require 'sinatra/partial'

require_relative './controllers/application'
require_relative './controllers/peeps'
require_relative './controllers/users'
require_relative './controllers/sessions'
require './lib/helpers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

class Chitter < Sinatra::Base

  helpers ApplicationHelpers

  set :public_folder, Proc.new { File.join(root, '..', '..', "public") }
  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions
  set :super_sessions, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
