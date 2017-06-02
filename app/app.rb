require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/add_peep' do
    erb :add_peep
  end

  run! if app_file == $0
end
