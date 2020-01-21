require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'chitter'
  end

  get '/peeps' do
    peeps = [
              "peep 1",
              "peep 2",
             ]
  
    peeps.join
  end

  run! if app_file == $0
end