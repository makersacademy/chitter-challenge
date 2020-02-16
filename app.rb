require 'sinatra/base'

class Chitter < Sinatra::Base
    
    get '/' do
        erb :index
    end

    get '/make_a_peep' do
        erb :make_a_peep
    end

    get '/view_peeps' do
        erb :view_peeps
    end

    
    run! if app_file == $0
end