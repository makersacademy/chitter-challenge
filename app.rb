require 'sinatra/base'
require './lib/peep'

class Peeps < Sinatra::Base
    get '/peeps' do
      @peeps = Peep.all
      erb :'index'
    end

  run! if app_file == $0
end