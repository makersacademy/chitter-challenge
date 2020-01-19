require 'sinatra/base'
require_relative './lib/chitter'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Chitter_Peep.view_all
    erb :index
  end

  post '/add_peep' do 
    Chitter_Peep.post_peep(body: params[:peep_body])
    redirect '/'
  end 

  run! if app_file == $0
end