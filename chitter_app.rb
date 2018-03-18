require 'sinatra/base'
require './lib/peep.rb'


class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/add-a-new-peep' do
    erb :add_a_new_peep
  end

  post '/create-a-peep' do
    Peep.create(message: params['message'])
    redirect('/')
  end

  run! if app_file == $0
end
