require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter, want to peep?'
  end

  run! if app_file == $0
end