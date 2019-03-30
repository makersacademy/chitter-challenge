require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :view_peeps
  end

  post '/peep' do
    Peep.create(content: params[:peep_content])
    redirect '/'
  end
end
