require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :peeps
  end

  post '/peep' do
    p params
    @peep = params[:peep]
    erb :index
  end

  run! if app_file == $0

end
