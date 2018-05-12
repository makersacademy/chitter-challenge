require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Testing infrastructure working!'
  end

  get '/peeps' do
     @peeps = Peep.all
     erb(:peepage)
  end

  run! if app_file == $0

end
