require 'sinatra/base'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitter' do 
  "What is on your mind?"
  # erb :index
 end 

 run! if app_file == $0

end 

