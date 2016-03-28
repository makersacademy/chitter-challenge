ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'datamapper_setup'
require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base



  get '/' do
    'Hello chitter!'
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end
