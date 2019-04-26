require 'sinatra/base'
require 'sinatra'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb(:chitter)
  end

  run! if app_file == $0
end
