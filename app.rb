require 'sinatra'

class ChitterApp < Sinatra::Base

    get '/test' do 
        "Hello chitter"
    end

    get '/home' do 
    p ENV 
    end

    run! if app_file == $0 
end