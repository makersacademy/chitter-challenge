require 'sinatra/base'
require_relative "./lib/peep"
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect to '/peeps'
  end
end
