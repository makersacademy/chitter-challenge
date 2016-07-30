require 'sinatra/base'
# require 'models/peep'

class Chitter < Sinatra::Base

  # DO WE WANT THIS?
  get '/' do
    'Hello Chitter!'
  end

  get '/peeps' do
    erb :'peep'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
