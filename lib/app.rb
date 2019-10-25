require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter_feed'
  end

  get '/chitter_feed' do
    erb :feed
  end
end
