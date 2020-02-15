require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :peeps
  end

  get '/post' do 
    erb :post
  end 

  post '/post' do 
    redirect '/'
  end 

end
