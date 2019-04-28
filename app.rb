require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    @peeps_list = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.post(params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
