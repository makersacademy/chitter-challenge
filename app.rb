require 'sinatra/base'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base
  get '/chitter' do
    @peeps = Chitter.print_peeps
    erb :index
  end

  run! if app_file == $0
end
