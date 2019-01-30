require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    'Hello This is my second peep'
  end

  run! if app_file ==$0

end
