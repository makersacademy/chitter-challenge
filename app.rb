require 'sinatra'

# The main Chitter class for the app
class Chitter < Sinatra::Base

  get '/test' do
    'Test page. Web infrastructure working'
  end

end
