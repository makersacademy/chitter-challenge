ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base

  get '/peeps' do
    # .all is a DataMapper method which fetches all the data from
    # the database that belong to the "Peep" class
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
