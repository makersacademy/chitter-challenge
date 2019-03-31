require 'sinatra/base'
current_dir = Dir.pwd

Dir["#{current_dir}/models/*.rb"].each { |file| require file }
# loads model files

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  # register Sinatra::ActiveRecordExtension

  get '/' do 
  'testing'
  
  end

  get '/messages' do 
    @messages = Message.all.sort.reverse
    erb(:'messages/index')

  end 

  get '/messages/new' do 
    
    erb(:'messages/new')
  end 


  get '/users/new' do 
    #sign up page
    


  end 





  post '/messages/new' do 
    @message = Message.create(content: params[:content])
    redirect '/messages'
  end 




  run! if app_file == $0
end 
