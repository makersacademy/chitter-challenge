require 'sinatra/base'

class Chitter < Sinatra::Base

    get '/' do
        erb :'peeps/index'
    end

    post '/peeps' do
        params['message']
    end

    get '/peeps/new' do
        erb :'peeps/new'
    end

    run! if app_file == $0

end
