require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'Time'

class Chitter < Sinatra::Base
  get '/' do
    Peep.create(content: "This is a test peep", time: Time.now)
    @peeps = Peep.all
    erb (:index)
  end

  run! if app_file == $0
end