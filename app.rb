require 'sinatra'
require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :method_override

  get '/feed' do 
    @peeps = Peep.all
    erb :'feed/index'
  end

  post '/feed' do
    Peep.create(message: params[:peep])
    redirect('/feed')
  end

  delete '/feed/:id' do 
    Peep.delete(id: params[:id])
    redirect('/feed')
  end

  get '/feed/:id/edit' do 
    @peep = Peep.find(id: params[:id])
    erb :'feed/edit'
  end

  patch '/feed/:id' do 
    Peep.update(id: params[:id], message: params[:peep])
    redirect('/feed')
  end

  run! if app_file == $PROGRAM_NAME
end