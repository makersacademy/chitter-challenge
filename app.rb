require 'sinatra'
require_relative './lib/peeps.rb'


class ChitterWebApp < Sinatra::Base

    get '/homepage' do
    
       erb(:index)

    end

    post '/peep' do
        p params
        
        Peep.post_peep(params[:user_id], params[:status])
       
        erb(:add_peep)
    end

    post '/peep/new' do
         redirect '/homepage'
    end

    run! if app_file == $0
end