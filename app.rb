require 'sinatra/base'

class ChitterManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/peeps' do
    @peeps = params["peeps"]
    erb :peeps
  end

  run! if app_file == $0
end