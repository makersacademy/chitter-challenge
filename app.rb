require 'sinatra/base'

class Chitter < Sinatra::Base

    enable :sessions
    
    get '/' do 
        session[:login] == true ? redirect('/home') : redirect('/login')
    end

    get '/login' do 
        erb(:login)
    end

    get '/signup' do 
        erb(:signup)
    end
end