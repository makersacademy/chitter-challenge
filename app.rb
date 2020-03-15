require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    "Posts"
  end

  run! if app_file == $0
end