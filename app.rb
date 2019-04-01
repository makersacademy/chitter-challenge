require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base 
    enable :sessions
    get '/' do 
        erb :homepage
    end 

    get '/peepfeed' do
        @peeps = Peep.all
        erb :index 
    end

    run! if app_file == $0
end
