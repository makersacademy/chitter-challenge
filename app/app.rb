require 'sinatra/base'

require_relative 'models/peep'

class Chitter < Sinatra::Base

  TIME_FORMAT = '%H:%M, %d.%m.%y '

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
