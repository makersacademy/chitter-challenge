require 'sinatra/base'
require_relative 'database_env_setup'
require './lib/peep'

class Chitter < Sinatra::Base
    database_setup

    get '/' do
        'Hello world'
    end

    get '/peeps' do
        @peeps = Peep.show
        erb :peep_list
    end
    
    get '/peeps/add' do
       erb :add_peep
    end

    post '/peeps/add' do
        Peep.add(params[:peep_content])
        redirect '/peeps'
    end


    run! if app_file == $0
end