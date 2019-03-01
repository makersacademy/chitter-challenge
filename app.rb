require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base


  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create_peep(params[:user_name],params[:handle],params[:peep_text])
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end