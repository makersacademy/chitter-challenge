# ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require './app/models/peep'

class ChitterChallenge < Sinatra::Base
  # get '/' do
  #   erb(:home)
  # end

  # get '/composepeep' do
  #   erb(:'peeps/new')
  # end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end
end
