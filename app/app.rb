ENV['RACK_ENV'] ||= 'test'
require_relative 'data_mapper_setup'
require 'sinatra/base'

# this class represents a part of our program
class Chitter < Sinatra::Base
  get('/') do
    $peeps = Peep.all.reverse
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
