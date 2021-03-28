require 'sinatra'
require_relative './lib/peeps.rb'


class ChitterWebApp < Sinatra::Base

    get '/homepage' do
    
       erb(:index)

    end

    post '/peep' do
        redirect '/homepage'
    end

    run! if app_file == $0
end