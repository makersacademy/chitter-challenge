require 'sinatra/base'

class ChitterApp < Sinatra::Base

  not_found do
    status 404
    erb :oops
  end

  get '/' do
    "Hello, Chitter!"
    erb :oops
  end

  run! if app_file == $0
end
