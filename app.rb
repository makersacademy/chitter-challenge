require 'sinatra/base'
require 'peeps'

class Chitter < Sinatra::Base

  get '/' do
    "Chitter"
  end

  get '/peeps' do
    @peeps = [
      "I just ate an apple",
      "Chitter is the best",
      "Howdy"
    ]
    erb :'peeps/index'
  end

  run! if app_file == $0
end
