require 'sinatra/base'
require_relative './lib/peep'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  # enable :method_override, :sessions

  get '/' do
    @peeps = Peep.all(:order => [ :creation_time.desc ])
    erb :index
  end

  post '/peep' do
    Peep.create(content: params[:peep], creation_time: Time.now )
    redirect '/'
  end

  run! if app_file == $0
end
