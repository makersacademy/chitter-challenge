require 'sinatra/base'
require './lib/model.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = ChitterHandler.retrieve_peeps
    erb :chitter_feed
  end
end
