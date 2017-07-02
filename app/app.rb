ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require './app/init.rb'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end
















  run! if app_file == $PROGRAM_NAME
end
