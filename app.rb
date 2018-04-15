require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    'hello world'
  end
end
