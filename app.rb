require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = [
      'This is so cool',
      'I am sending a peep',
      'Isolation #COVID-19'
    ]
    erb :index
  end

end