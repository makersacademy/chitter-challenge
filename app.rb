require 'sinatra/base'
require './lib/cheep'

class Chitter < Sinatra::Base

  get '/' do
    'Cheeps'
  end

  get '/cheep_feed' do
    @cheeps = Cheep.all
    erb :cheep_feed
  end

  run! if app_file == $0
end