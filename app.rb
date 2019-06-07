require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep-form' do
    erb :peep_form
  end

  post '/create-peep' do
    peep = Peep.new(params[:name], params[:content])
    peep.create
    redirect '/'
  end
end
