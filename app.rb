require 'sinatra/base'
# require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end
end
