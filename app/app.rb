require 'sinatra'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    'hello'
  end

  get '/secret' do
    'secret hello'
  end

end
