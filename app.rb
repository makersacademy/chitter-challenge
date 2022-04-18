require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :method_overide, :sessions

  get '/' do
    'Hello world'
  end

  run! if app_file == $0
end
