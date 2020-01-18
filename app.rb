require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  run! if app_file == $0
end
