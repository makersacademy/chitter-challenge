require 'sinatra/base'
require './lib/chitter'
require 'rom'

class Chitter < Sinatra::Base
  enable :method_override


end
