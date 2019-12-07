require 'sinatra'
require 'sinatra/activerecord'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :views, './lib/views'
  end

  get '/' do
    'Hello World'
  end
end
