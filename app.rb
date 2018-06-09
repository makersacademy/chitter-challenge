require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Page is working!'
  end

  run! if app_file ==$0
end
