require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    get '/' do
        'tweet tweet'
    end

    get '/tweets' do
        @tweets = Tweet.all
        erb :'tweets/index'
    end



    run! if app_file == $0
end