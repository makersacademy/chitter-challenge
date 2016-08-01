ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class BookmarkManager < Sinatra::Base

require_relative './lib/send_email'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'

  run! if app_file == $0
end
