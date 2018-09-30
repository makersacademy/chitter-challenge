require 'sinatra/base'
require './lib/dm-psql'

class Chitter < Sinatra::Base
  get '/?' do
    redirect '/peep/all'
  end

  get '/peep/all/?' do
    'Display all peeps'
  end

  run! if app_file == $0
end
