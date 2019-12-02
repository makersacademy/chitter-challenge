require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = [
      "Hello World!",
      "I am feeling sunny today!",
      "Minions will takeover the world."
    ]
    @peeps.join

    erb :index
  end

  run! if app_file == $0

end
