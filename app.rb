require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do

    @peeps = [
      "This is a peep",
      "This is another peep",
      "This is a third peep"
    ]
    erb :index
  end

  run! if app_file == $0
end
