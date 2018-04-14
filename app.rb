require 'sinatra'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :home
  end

  run! if app_file == $0
end
