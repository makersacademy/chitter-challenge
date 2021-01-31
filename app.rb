require 'sinatra'

# The main Chitter class for the app
class Chitter < Sinatra::Base

  # test page
  get '/test' do
    'Test page. Web infrastructure working'
  end

  get '/' do
    'Welcome to Chitter'
  end

end
