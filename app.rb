require 'sinatra/base'

class PeepManager < Sinatra::Base
  get '/' do
    'Hello'
  end

  get '/peeps' do
    'First peep'
  end

  run! if app_file == $0

end

