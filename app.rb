require_relative 'lib/peep'
require 'pg'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :view_peeps
  end

  post '/peep' do
    Peep.create(params[:peep_content])
    redirect '/'
  end
end
