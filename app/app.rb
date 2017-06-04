require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/posts' do
    'Hello world!'
  end

end
