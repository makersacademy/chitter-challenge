require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Hello world'
  end

  get '/' do
    erb :index
  end
end
