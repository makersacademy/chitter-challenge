require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
