require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    "text"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
