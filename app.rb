require 'sinatra/base'
require 'pg'
require_relative "./lib/peep"
require_relative "./database_setup"

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
