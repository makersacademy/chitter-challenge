require 'sinatra/base'
require 'pry'


class ChitterApp < Sinatra::Base
    set :sessions, true

    get '/' do 
        erb :home
    end

    get '/signup' do 
        erb :signup
    end 

    get '/signin' do 
        erb :signin
    end 
  
end  