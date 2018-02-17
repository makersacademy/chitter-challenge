require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/cheet'

class Chitter < Sinatra::base
  register Sinatra::Flash
  enable :sessions

end
