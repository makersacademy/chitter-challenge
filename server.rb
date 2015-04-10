require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  get '/' do
    erb :homepage
  end

  post '/' do
    @username = params[:username]
    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if app_file == ChitterChatter

end
