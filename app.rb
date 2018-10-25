require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    redirect '/'
  end

  run! if app_file == $0

end
