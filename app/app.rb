require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :peep
  end

  get '/images/chitter.png' do
   "Hello World"
 end

  run! if app_file == $0
end
