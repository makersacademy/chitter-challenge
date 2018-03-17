require 'sinatra/base'

class BlahBlah < Sinatra::Base
  set :sessions, true

  get '/' do
    'Testing infrastructure done'
  end

  run! if app_file == $0
end
