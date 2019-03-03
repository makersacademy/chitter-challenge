require 'sinatra/base'
require './lib/peep'

class ChitterWeb < Sinatra::Base

  get '/chitter/peep/new' do
    erb(:new_peep)
  end

  post '/chitter/peep/new' do
    message = params[:message]
    Peep.create(message: message, posted_by: 1)
    redirect '/chitter/peep/all'
  end

  get '/chitter/peep/all' do
    @all_peeps = Peep.all
    erb(:all_peeps)
  end

  get '/chitter/peep/:id' do
    @peep = Peep.read(id: params[:id])
    erb(:peep_detail)
  end

  run! if app_file == $0
end
