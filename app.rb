require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'


class Chitter < Sinatra::Base
    configure :development do 
        register Sinatra::Reloader
    end 

    get '/' do
        'Chitter'
    end 

    get '/chitter' do 
       @peeps = Peep.all
       erb :'peeps/index'
    end 

    post '/add_peep' do 
      Peep.add(peep: params['new_peep'])
      redirect '/chitter'
    end

    run! if app_file  == $0
end 