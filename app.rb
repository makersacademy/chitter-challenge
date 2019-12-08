require 'sinatra/base'

class Chitter < Sinatra::Base

  # enable :sessions

  get '/' do
    'Hello!'
  end

    run! if app_file == $0

end
