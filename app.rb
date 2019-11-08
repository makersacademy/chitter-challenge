require 'sinatra/base'

class MyApp < Sinatra::Base

    get '/' do
        "Welcome to Chitter!"
    end
end