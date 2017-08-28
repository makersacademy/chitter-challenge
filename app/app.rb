ENV['RACK_ENV'] ||= 'test'
require_relative 'data_mapper_setup'
require 'sinatra/base'

# require './models/peep'
# require './models/user'

class Chitter < Sinatra::Base
  get('/') do
    $peeps = Peep.all
    erb(:'links/index')
  end

  get('/all') do
    $peeps
    erb(:'links/index')
  end

  get('/new') do
    erb(:'links/peep_field')
  end

  run! if app_file == $PROGRAM_NAME
end
