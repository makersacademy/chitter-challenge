require 'sinatra/base'

class Chitter < Sinatra::Base  
  
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = [ 
              "Me, in hell: I was told there would be a “special” place for me?",
              "Congratulations to the Astronauts that left Earth today. Good choice"
            ]
    erb :'peeps/index'
  end

  run! if app_file == $0
end
