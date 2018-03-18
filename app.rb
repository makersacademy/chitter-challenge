require 'sinatra/base'
require './lib/peep'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/create_new_peep' do
    Peep.create(txt: params[:txt])
    redirect '/'
  end

  run! if app_file == $0

end
