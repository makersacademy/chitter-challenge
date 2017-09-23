require 'data_mapper'
require 'sinatra/base'
require_relative './models/peep.rb'


class Chitter < Sinatra::Base

  get '/' do
    'You arrived at the homepage'
  end

  run! if app_file == $PROGRAM_NAME
end
