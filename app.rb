require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :home
  end

  get '/add_new_peep' do
    "Hello World"
    erb :add_new_peep
  end


  run! if app_file == $0

end
