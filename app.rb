require 'sinatra/base'
require './lib/chitter.rb'

class Chitter_challenge < Sinatra::Base

  get '/' do


  end




  run! if app_file == $0
end
