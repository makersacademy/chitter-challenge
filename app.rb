require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peep/new' do
    erb(:'peep/new')
  end

  post '/peep/store' do
    Peep.create(params[:peep])
    redirect '/'
  end
end