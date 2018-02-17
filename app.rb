require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = ["test peep", "second test peep"]
    erb (:index)
  end

  run! if app_file == $0
end