require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/post_peep' do
    erb :'post_peep'
  end


  run! if app_file == $0
end
