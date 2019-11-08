require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super super secret'
  
  get '/' do
    erb :index
  end

  run! if app_file == $0

end
