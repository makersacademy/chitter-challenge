require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/chit' do
    $chit = params[:chit]
    redirect '/chits'
  end

  get '/chits' do
    @chit = $chit
    erb :chit
  end

  run! if app_file == $0
end
