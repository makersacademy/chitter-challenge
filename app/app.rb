require 'sinatra/base'

class Chitter < Sinatra::Base


  get '/' do
    erb(:sign_up)
  end

  post '/' do
    
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
