require 'sinatra/base'

class Chitter < Sinatra::Base
    
    get '/' do
        'Chitter Home Page'
    end
    
end