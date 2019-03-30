require 'sinatra/base'


class Chitter < Sinatra::Base
  enable :sessions, :method_override
  # register Sinatra::ActiveRecordExtension

  get '/' do 
  'testing'
  
  end

  get '/messages' do 
    
    erb(:'messages/index')
  end 

  get '/messages/new' do 
    
    erb(:'messages/new')
  end 


  post '/messages/new' do 
    
    redirect '/messages'
  end 




  run! if app_file == $0
end 
