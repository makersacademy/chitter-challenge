require 'sinatra/base'
require './lib/peeps'
require_relative 'database_helpers'

database_setup

class Chitter < Sinatra::Base

get '/' do
  erb :index
end

end
