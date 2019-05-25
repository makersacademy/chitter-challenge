require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    p "Peep submitted"
    p params
    #erb :chitter
  end

  run! if app_file == $0
end
