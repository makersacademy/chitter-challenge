ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base

  require_relative 'data_mapper_setup'
  require_relative 'server'
  require_relative 'controllers/cheeps'
  require_relative 'controllers/sessions'
  require_relative 'controllers/users'

  get '/cancel' do
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
