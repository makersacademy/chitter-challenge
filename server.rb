require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/peep'
require './lib/reply'
require './helpers'

DataMapper.finalize
DataMapper.auto_upgrade!

# require_relative 'controllers/app'

class Chittter < Sinatra::Base
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

  include Helpers
  # start the server if ruby file executed directly
  run! if app_file == $0
end

require './controllers/app'
require './controllers/new_user'
require './controllers/post_user'
require './controllers/new_session'
require './controllers/post_session'
require './controllers/delete_session'
require './controllers/new_peep'
require './controllers/post_peep'
require './controllers/get_reply'
require './controllers/post_reply'