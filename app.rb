require 'sinatra/base'
require 'rubygems'
require 'data_mapper'

class Chitter < Sinatra::Base
  get '/' do
    peeps = [
      'Test peep 1',
      'Test peep 2',
      'Test peep 3'
    ]
  end

  run! if app_file == $0

end
