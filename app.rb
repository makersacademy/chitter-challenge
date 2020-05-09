require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  get '/' do
    "It's Chitter Chatter Time!"
  end

  run! if app_file == $0

end
