require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require './data_mapper_set_up'
require './helpers'

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