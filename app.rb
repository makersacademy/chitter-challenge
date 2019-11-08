require 'sinatra/base'

class MyApp < Sinatra::Base

    get '/' do
        erb:"messages/index"
    end

end