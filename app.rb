require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter away'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  run! if app_file == $0
end
