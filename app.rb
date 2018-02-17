require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

end
