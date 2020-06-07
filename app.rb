require 'sinatra/base'
# require_relative './lib/bookmark'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/chitters' do
    "Chitters"
  end

  run! if app_file == $0

end
