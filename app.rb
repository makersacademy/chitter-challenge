require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  run! if app_file == $0

end
