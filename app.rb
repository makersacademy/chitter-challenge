require 'sinatra'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base

    get '/test' do 
        "Hello chitter"
    end

    get '/home' do 
        @chitters = Chitter.timeline
        erb :homepage 
    end

    post '/post_peep' do
        Chitter.post_peep(peep: params[:peep])
        redirect '/home'
    end

    run! if app_file == $0 
end