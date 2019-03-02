require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peepmessage = Peep.all
    erb :index
  end

 run! if app_file == $0
end
