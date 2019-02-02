require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb(:peep)
  end

  post '/peep' do
    @peeps = params[:peep]
  end

  run! if app_file == $0
end
