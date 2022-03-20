require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/peep' do
    Peep.create(content: params[:content], time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end
