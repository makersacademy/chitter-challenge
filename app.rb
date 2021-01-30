require 'sinatra/base'

class Chitter < Sinatra::Base
    get '/' do 
        'Welcome to Chitter. Please sign in'
    end 
    run! if app_file == $0
end 

