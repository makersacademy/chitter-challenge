require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do

    peeps = [
    'peep test 1',
    'peep test 2',
    'peep test 3'
    ]

  end

  run! if app_file == $0

end
