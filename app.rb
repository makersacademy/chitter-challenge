require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
