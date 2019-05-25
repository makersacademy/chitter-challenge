

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Hi Dad"
  end

  get '/home' do
    "Hey Bros"
  end

end
