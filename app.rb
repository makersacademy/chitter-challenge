require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/peeps/timeline' do
    @peeps = Peep.all
    erb :'peeps/timeline'
  end

  run! if app_file == $0
end
