require 'sinatra/base'
require './lib/peep.rb'


class Chitter < Sinatra::Base
  get '/' do
    @peep = Peep.all
    erb :index
  end

  get '/add-a-new-peep' do
    erb :add_a_new_peep
  end

  post '/add-a-new-peep' do
    time = DateTime.now
    Peep.create(params['message'], time)
    redirect('/')
  end

  run! if app_file == $0
end
