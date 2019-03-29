require 'sinatra/base'

class Chitter < Sinatra::Base 
    get '/' do 
        'Chitter'
    end 

    get '/peepfeed' do
        peeps = [
        "peep1",
       "peep2",
       "peep3"
        ]
        peeps.join(" ")
    end

    run! if app_file == $0
end
