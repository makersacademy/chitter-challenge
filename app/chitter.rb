require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    "Hello World"
  end
  
  run! if app_file == Chitter
end
