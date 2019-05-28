require 'sinatra/base'
require './lib/chitter.rb'


class Chitter < Sinatra::Base
    get '/' do 
        'Hi!'
        erb :index
    end 

    get '/chitter' do 
        @peep_list = Peep.all
        erb :chitter
    end
    
    get '/peep_new' do 
        erb :add_peep
    end 

    post '/add_peep' do 
        Peep.create(name: params[:name], message: params[:message], posted_at: Time.now)
        redirect '/chitter'
    end 

    run! if app_file == $0
end 

