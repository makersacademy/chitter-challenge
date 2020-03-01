require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

    before do
        @peep = Peep.instance
    end

    get '/homepage' do
        @peep
        erb :index
    end

    post '/homepage' do
     p   @peep = Peep.create(params[:input])
        redirect '/homepage'
    end

end
