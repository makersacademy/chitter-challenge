require 'sinatra/base'

class Chitter < Sinatra:: base
    
    get '/'
    'Welcome to Chitter'
    end

    
    run! if app_file == $0
end