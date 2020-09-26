require 'pg'
require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  #register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/' do
    #some ruby, adding a post to the db
    erb :home
  end

  run! if app_file == $0

end
