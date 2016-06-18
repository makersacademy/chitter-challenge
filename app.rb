require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/create_user' do
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
