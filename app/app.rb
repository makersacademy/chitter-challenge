ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require 'database_cleaner'
# require'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Chitting'
    Chit.create

  end
end
