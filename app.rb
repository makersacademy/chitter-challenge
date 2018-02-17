require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/add_peep' do
    @peeps = params[:new_peep]
    erb(:index)
  end

  run! if app_file == $0
end
