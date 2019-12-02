require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/viewpeeps' do
  end
  run! if app_file == $0

end
