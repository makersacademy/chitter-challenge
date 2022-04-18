require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

require './database_connection_setup'

require_relative './lib/peep'
# require 'sinatra/activerecord'

# set :database_file, '/config/database.yml'

class Chitter < Sinatra::Base
  # register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/peeps' do
    @peeps = Peep.all
    @peeps_sorted = @peeps.sort_by { |peep| peep.time_created }.reverse
    erb :"/peeps/index"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to '/peeps'
  end

  get '/peeps/new' do
    erb(:"/peeps/new")
  end

  run! if app_file == $0
end
