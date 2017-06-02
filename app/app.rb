require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/add_peep' do
    erb :get_peep
  end

end
