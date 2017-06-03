require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  get '/' do
    "Homepage"
  end

  get '/new' do
    erb :new
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep_content])
    redirect '/peeps'
  end

end
