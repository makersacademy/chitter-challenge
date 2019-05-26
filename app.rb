require 'sinatra/base'
require_relative './lib/peep'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  # enable :method_override, :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(content: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
