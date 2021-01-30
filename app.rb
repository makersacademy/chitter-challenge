require 'sinatra'
require "./lib/peep"


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/new_peep' do
    Peep.create(message: params[:peep], sender: 'claude')
    redirect('/')
  end


end
