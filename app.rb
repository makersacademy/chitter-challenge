require 'sinatra/base'
require_relative 'database_env_setup'

class Chitter < Sinatra::Base
    database_setup

    get '/' do
        'Hello world'
    end

    get '/peeps' do
        erb :peep_list
    end


    run! if app_file == $0
end