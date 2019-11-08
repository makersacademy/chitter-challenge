require 'sinatra/base'
require './lib/chits'

class MyApp < Sinatra::Base

    get '/' do
        erb:"messages/index"
    end

    get '/chits' do
        @chitter = Chits.all
        erb:"messages/chits"
     end
     run! if app_file == $0
    
end
