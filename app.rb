require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hello world!'
  end

  get '/cheeps' do
    @cheeps = Cheeps.all
    erb :'cheeps/index'
  end
  run! if app_file == $0
end
