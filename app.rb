require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do 
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
    
  end

  post '/signup' do
    user = User.create(name: params[first_name], email: params[email], password: params[password])
  end

end