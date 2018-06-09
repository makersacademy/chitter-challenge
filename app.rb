require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
    enable :sessions
    get '/' do
        @peeps = Peep.all.reverse
        erb :index
    end

    post '/new' do
        peep = params['content']
        Peep.create(content: peep)
        redirect '/'
    end

    get '/signup' do
        erb :signup
    end

    post '/signup' do
        redirect '/'
    end
end