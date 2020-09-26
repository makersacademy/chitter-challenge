require 'sinatra/base'
require_relative './lib/database_connection'


class Chitter < Sinatra::Base

    get '/' do
        'Hello world'
    end

    get '/peeps' do
        erb :peep_list
    end


    run! if app_file == $0
end