require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/view' do
    peeps = [
      "Test Peep",
      "Peep Testing!"
    ]
    peeps.join
  end

  run! if app_file == $0
end
