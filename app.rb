require 'sinatra'
require './db_setup'

class Chitter < Sinatra::Base
  get '/' do
    'testing fraemwork working'
  end

  get '/peeps' do
    @peeps = Peep.sort_by_date_created(Peep.all)
    erb(:peeps)
  end

  post '/peeps' do
    Peep.new(body: params[:body]).save
    redirect('/peeps')
  end
end
