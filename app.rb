require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    'Hello World'
  end

end
