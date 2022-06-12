require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep"
    ]
    peeps.join
  end 

  run! if app_file == $0
end