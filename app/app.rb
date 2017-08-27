require 'sinatra/base'
require './models/chit.rb'
require 'database_cleaner'

class Chitter < Sinatra::Base

  get '/' do
    'Playing with bookmarks'
  end
end
