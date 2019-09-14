require 'sinatra/base'
require './lib/peeps.rb'
class Peep < Sinatra::Base

get '/' do
  @peeps = Peeps.all
  erb :index
end


  run! if app_file == $0
end
