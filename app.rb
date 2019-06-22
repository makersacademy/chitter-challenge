require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base

  enable :sessions

  run! if app_file ==$0

end
