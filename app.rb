require 'sinatra/base'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps' do
    @peeps = params["peeps"]
    @timestamp = params["*************"]
    erb :peeps
  end

  run! if app_file == $0
end