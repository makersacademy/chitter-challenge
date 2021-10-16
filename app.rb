require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require 'uri'
require './lib/peep'
=begin
require './lib/reply'
require './lib/tags'
require './lib/peep_tag'
=end 


class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do 
    'Chitter'
  end

  run! if app_file == $0

end
