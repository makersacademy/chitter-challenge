require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello World!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  run! if app_file == $0
end
