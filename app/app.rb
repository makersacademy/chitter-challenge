require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  get '/peeps/all' do
    @peeps = Peep.all
    erb(:'peeps/all')
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:new_peep])
    redirect('/peeps/all')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

end
