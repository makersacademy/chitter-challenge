

require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    erb :"home/index"
  end

  get '/home/new' do
    erb :"home/new"
  end

  post '/new_peep' do
    Peep.create(peep: params[:peep_text])
    redirect '/home'
  end

end
