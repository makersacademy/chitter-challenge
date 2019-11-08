require 'sinatra/base'

class Chitter < Sinatra::Base

  $peep = Array.new

  get '/' do
    erb :feed
  end

  post '/feed' do
    $peep << params[:peep]
    redirect '/'
  end

  run if app_file == $0
end
