require 'sinatra/base'

class Chitter < Sinatra::Base
  set :session_secret, 'super secret'
    enable :sessions
  get '/' do
    erb :index
  end

  get '/compose_peep' do
    erb :compose_peep
  end

  post '/' do
    @peep_content = params[:peep_content]
    erb :index
  
  end


  run! if app_file == $0

end
