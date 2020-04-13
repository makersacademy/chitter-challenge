require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :'chitter_feed'
  end

  post '/' do
    'My first peep'
  end

  run! if app_file == $0
end