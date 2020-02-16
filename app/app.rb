require 'sinatra/base'
require_relative '../lib/peep'
require_relative './database_connection_setup'

class App < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/new' do
    Peep.create(username: params[:username], body: params[:body])
    redirect '/'
  end

  get '/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :edit
  end

  patch '/:id' do
    Peep.edit(id: params[:id], body: params[:body])
    redirect '/'
  end

  delete '/:id' do
    Peep.delete(id: params[:id])
    redirect '/'
  end

end
