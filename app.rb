require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  get '/postmessage' do
    erb :'postmessage'
  end

  post '/postingmessage' do
    redirect '/'
  end

  run! if app_file == $0

end
