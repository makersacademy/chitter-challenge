require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :method_override
  
  get '/' do
    "Welcome to Chitter!"
  end

  run! if app_file == $0
end