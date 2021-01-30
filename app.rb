require 'sinatra'

class Chitter < Sinatra::Base

    get '/test' do 
        "Hello chitter"
    end

    run! if app_file == $0 
end