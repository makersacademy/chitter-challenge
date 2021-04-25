require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :"peeps/index"
  end

  post '/peeps' do
    Peeps.create(content: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0

end
