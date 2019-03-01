require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    '<a href="/peeps">See the peeps</a>'
  end

  get '/peeps' do
    peeps = [
      '1. Peep #3',
      '2. Peep #2',
      '3. Peep #1'
    ]
    peeps.join
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0

end
