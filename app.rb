require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterManager < Sinatra::Base 
    configure :development do 
        register Sinatra::Reloader
    end 

    get '/chitter' do
        @peeps = Chitter.all
        erb :'chitter/index'
    end

    get '/chitter/new' do
        erb :'chitter/new'
    end 

    post '/chitter' do
        Chitter.post(message: params[:message])
        redirect '/chitter'
    end 

    run! if app_file == $0
end 

    