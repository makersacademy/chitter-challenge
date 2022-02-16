require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/peep/:id' do
    @peep =  Peep.find_by_id(id: params[:id])
    erb :"peeps/show"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    id = Peep.create(peep: params[:peep])
    redirect to "/peep/#{id}"
  end

  # Start the server if this file is executed directly 
  # (do not change the line below)
  run! if app_file == $0
end
