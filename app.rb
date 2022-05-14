require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    peeps = [
      'Elon who?',
      'COYS',
      'How almost two o\'clock is it?'
    ]

  end 

  run! if app_file == $0
end