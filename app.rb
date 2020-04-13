require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content], time: Time.now)
    "Peep created"
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
