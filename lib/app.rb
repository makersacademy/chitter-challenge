

class Chitter < Sinatra::Base

  get '/' do
    'Bookmark CEO!'
    erb :index
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
