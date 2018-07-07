require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

# Acts as the controller
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
