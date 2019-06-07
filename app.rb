require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Application

  get '/peep' do
    "Hello"
  end
  
  get  '/entermessage' do
    erb :postmessage
  end

  post '/usermessage' do
    
   @id =  Peeps.add_name(params[:username])
    Peeps.add_message(params[:message], @id)
    p @posts = Peeps.all

    erb :display
  end


end