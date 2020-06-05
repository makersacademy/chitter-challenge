require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = [
      'i need a holiday',
      'look at my cat',
      'HUNGRY'
    ]
    erb :index
  end

end
