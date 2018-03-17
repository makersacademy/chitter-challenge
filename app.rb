require_relative'./lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.show_all
    erb(:index)
  end

  run! if app_file == $0
end
