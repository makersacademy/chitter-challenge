require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do
    erb :index
  end    

  post '/chitts' do
    @post_chitt = params[:post_chitt]
    erb :chitts
  end

  get '/chitts' do
    chitts = [
      "Hello Chitter Worlds!",
      "The weather is great!",
      "Time for an ice cream!" 
      ]
    chitts.join   
  end
  # start the server if ruby file executed directly
  run if app_file == $0
  
end 
