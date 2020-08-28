require 'sinatra/base'

class  Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep = $peep
    erb :index
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/new_peep' do
    $peep = params[:peep]
    redirect '/'
  end

  run if app_file == $0

end
