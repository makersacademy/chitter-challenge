require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Hi there - You've made it to Chitter!"
  end

  run! if app_file == $0

end
