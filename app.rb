require 'sinatra/base'
require './lib/peeps'
class Chitter < Sinatra::Base

  get '/' do
    @timeline = Peeps.all
    erb :index
  end

  get '/add_peep' do
    erb :adding_peep
  end

  post '/add_peep' do
    @peep_message = params[:message]
    erb :index
  end

  run! if app_file == $0
end
