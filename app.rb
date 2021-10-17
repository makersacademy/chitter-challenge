require 'pg' # remove this later
require 'sinatra/base'
require 'sinatra/reloader'
# require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end
end
