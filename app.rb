require 'sinatra/base'
require_relative './lib/peep.rb'
# require 'rubygems'
# require 'data_mapper'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0

end
