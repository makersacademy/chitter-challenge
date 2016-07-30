require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  # DO WE WANT THIS?
  get '/' do
    'Hello Chitter!'
  end

  

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
