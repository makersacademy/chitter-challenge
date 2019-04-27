require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome To Chitter'
  end

  get '/peeps' do
    peeps = [
      'peep 6/1',
      'peep 5/1',
      'peep 4/1',
      'peep 3/1',
      'peep 2/1',
      'peep 1/1'
    ]
  end

  run! if app_file == $0
end
