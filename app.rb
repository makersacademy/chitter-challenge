require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/viewpeeps' do
    @peeps = Peeps.all
    erb :peepsdisplay
  end

  run! if app_file == $0

end
