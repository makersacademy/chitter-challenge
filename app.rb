require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    erb :viewing_peeps
  end

  run! if app_file == $0

end
