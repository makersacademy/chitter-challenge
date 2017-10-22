ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peep.rb'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all 
    erb :index
  end


run! if app_file == $0
end
