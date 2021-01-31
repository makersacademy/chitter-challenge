require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

    get '/' do
        erb :'peeps/index'
    end

    get '/peeps' do
        @peeps = Peep.all.reverse
        erb :'peeps/list'
    end

    post '/peeps' do
        Peep.post(message: params['message'])
        redirect '/peeps'
    end

    get '/peeps/new' do
        erb :'peeps/new'
    end

    run! if app_file == $0

end
