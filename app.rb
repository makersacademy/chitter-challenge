require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Cheeps'
  end

  get '/cheep_feed' do
    @cheeps = [
              "First cheep",
              "Second cheep",
              "Third cheep"
             ]
  
    erb :cheep_feed
  end

  run! if app_file == $0
end