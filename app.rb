require 'sinatra/base'
require './lib/peep'
require 'pg'
# require './database_connection_setup'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    p params
    redirect '/'
  end

end