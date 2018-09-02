require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @peep = $peep
    erb :feed
  end

  post '/feed' do
    $peep = params[:peep]
    redirect '/feed'
  end

  run! if app_file == $0
end
