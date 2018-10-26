require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base
  get '/' do

    @peeps = Peep.view_all
    erb :index
  end

  run! if app_file == $0
end
