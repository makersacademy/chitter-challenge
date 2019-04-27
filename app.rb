require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb(:'welcome')
  end

  get '/chitters' do
    erb(:'chitters/index')
  end

  run! if app_file == $0
end
