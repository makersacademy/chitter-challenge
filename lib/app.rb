require 'sinatra/base'


class Peep < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/peep' do
    peeps = [
      'My first peep',
      'My second peep'
    ]
  end


  run! if app_file == $0
end
