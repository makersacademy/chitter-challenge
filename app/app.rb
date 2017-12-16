require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome'
  end

  get '/posts' do
    'This is a test post'
  end
end
