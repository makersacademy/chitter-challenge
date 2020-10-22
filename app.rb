require 'sinatra/base'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitter' do 
  @new_peep = params[:peep]
  erb :index
 end 

 run! if app_file == $0

end 

