require 'sinatra/base'
require './lib/model'

class Chitter < Sinatra::Base
enable :sessions

 get '/chitterapp' do 
  @peeps = Peep.all
  erb :index
 end 

post '/chitterapp' do
   Peep.create(peeps: params[:message])
  
  redirect '/chitterapp'
end


 run! if app_file == $0

end 

 

    