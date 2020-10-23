require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    'I ran 8 miles today, #winning'
  end
end