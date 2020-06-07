require 'sinatra/base'
require_relative './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/chitters' do
    @chit = Chitterer.all
    erb :chitter_timeline
  end

  run! if app_file == $0

end
