require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = ["My first peep!"]
    erb :index
  end

  run! if app_file == $0
end
