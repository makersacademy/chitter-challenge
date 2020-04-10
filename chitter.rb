require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post "/send_compose_peep" do
    redirect '/compose_peep'
  end

  get '/compose_peep' do
    erb :send_peep
  end
end
