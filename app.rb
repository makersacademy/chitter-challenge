require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/feed' do
    erb :feed
  end

  run! if app_file == $0
end