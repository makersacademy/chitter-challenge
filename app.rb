require 'sinatra/base'

class Peeps < Sinatra::Base

  get '/' do
    'Peeps'
  end

run! if app_file == $0
end
