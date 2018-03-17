require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    peeps = [
              "My 1st peep",
              "My 2nd peep",
              "My 3rd peep"]
  end

  run! if app_file == $0
end
