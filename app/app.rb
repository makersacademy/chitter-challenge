ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

# require_relative data_mapper stup and controller files

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative 'controllers/peeps'
