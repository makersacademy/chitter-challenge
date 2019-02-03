require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/add_peep' do
    erb(:add_peep)
  end

  post '/' do
    Peep.create(body: params[:Peep], posted_at: Time.now.strftime('%d-%m-%Y %H:%M:%S'))
    redirect '/'
  end

end
