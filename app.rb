require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  run! if app_file == $0
end