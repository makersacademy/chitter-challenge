
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do

    "Chitter"
  end

  get '/feed' do
    peeps = [
      "Peep 1",
      "Peep 2",
      "Peep 3"
    ]
    peeps.join(" ")
  end
    

  run! if app_file == $0
end
