require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    "text"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/chitter/add_peep' do
    erb :new_peep
  end

  post '/new_peep_data' do
    Peep.create(params[:text])
    redirect('/chitter')
  end

  run! if app_file == $0
end
