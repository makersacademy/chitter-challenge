require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Testing infrastructure working!'
  end

  get '/peeps' do
     'Hello World'
  end

  run! if app_file == $0

end
