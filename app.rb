require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    p  @peeps
    erb :'index'
  end

  post '/peep' do
    Peep.create(id: params[:id], message: params[:messsage])
    redirect '/'
  end

  run! if app_file == $0
end