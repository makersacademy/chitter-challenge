require 'sinatra/base'
require './lib/users.rb'
require './lib/messages.rb'

class Chitter < Sinatra::Base

  run! if app_file == $0
end
