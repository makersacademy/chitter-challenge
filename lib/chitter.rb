require 'sinatra/base'
require './database_connection_setup'
require_relative './models/peep'

class Chitter < Sinatra::Application
  set :sessions, true
  set :layout, true

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.create(params[:peep_content])
    redirect '/peeps'
  end
end
