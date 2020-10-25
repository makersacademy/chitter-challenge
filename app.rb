require 'sinatra/base'

class  Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do 
    @peep = params[:peep]
    erb :index
  end







  run! if app_file == $0
end