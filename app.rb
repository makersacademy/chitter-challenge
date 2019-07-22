require 'sinatra'

class Chitter < Sinatra::Base
    get '/' do
        "hello world"
    end

    run! if app_file == Chitter
end
