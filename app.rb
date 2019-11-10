require 'sinatra/base'

class Chitter < Sinatra::Base 

    get '/' do 
        erb :index

    end 

    get '/peep' do
      erb :message
    end 

    post '/peeps/new' do 
        Chitter.create(url: params[:peep])
    end 


    get '/peep/new' do 
    
    end 

end 

