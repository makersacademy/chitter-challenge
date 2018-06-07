require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
    enable :sessions
    get '/' do
        @peeps = Peep.all
        erb :index
    end

    post '/new' do
        peep = params['content']
        Peep.all << peep
        redirect '/'
    end
end