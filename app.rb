require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], time: Time.now)
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect('/peeps')
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep], time: params[:time])
    redirect('/peeps')
  end

run! if app_file == $0
end
