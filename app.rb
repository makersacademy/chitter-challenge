require 'sinatra/base'

class Chitter < Sinatra::Base
    enable :sessions

    get '/' do 
        redirect '/login'
    end

    get '/login' do
        erb(:login)
    end


    run! if app_file == $0
end 