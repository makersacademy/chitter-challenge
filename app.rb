require 'sinatra'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
