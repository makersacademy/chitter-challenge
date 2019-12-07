require 'sinatra/base'
# require './lib/bookmark'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    "Test"
  end

  run! if app_file == $0
end
