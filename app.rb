require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    chits = ["This is Chitter",
      "Help I'm tired yo",
      "Can I just shock you? I like wine",
      "My cat was right about you"]

  end

  run! if app_file == $0
end
