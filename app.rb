require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    # peeps = [
    #   "This is my first peep!",
    #   "Look at me peep",
    #   "I am learning to code"
    # ]
    @peeps = Peeps.add
    erb :'peeps/index'
  end


  run! if app_file == $0

end
