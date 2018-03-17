require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    peeps = [
              "My 0th test peep",
              "Another test peep",
              "The last test peep"
             ]
  end

  run! if app_file == $0

end
