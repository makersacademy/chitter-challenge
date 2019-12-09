require 'sinatra/base'
require './lib/peeper.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
