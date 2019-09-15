require 'sinatra/base'

class Chitter_challenge < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :index
  end

  post '/peeps' do
    params['peep']
  end


  run! if app_file == $0
end
