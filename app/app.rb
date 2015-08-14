require_relative '../data_mapper_setup'
require_relative './models/peep'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

end