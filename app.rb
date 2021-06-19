require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    @peeps = Chitter.all
    p  @peeps
    erb :'index'
  end

  post '/peep' do
    Chitter.create(id: params[:id], message: params[:messsage])
    redirect '/'
  end

  run! if app_file == $0
end