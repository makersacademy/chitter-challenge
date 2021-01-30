require 'sinatra/base'

class Chitter < Sinatra::Base 

  get '/peeps'
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  run! if app_file == $0

end