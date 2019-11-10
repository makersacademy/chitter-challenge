require 'sinatra/base'

class Chitter < Sinatra::Base

  $peeps = Array.new

  get '/' do
    erb :feed
  end

  post '/feed' do
    $peeps << params[:peep]
    redirect '/'
  end

  run if app_file == $0
end
