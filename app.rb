require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Peeps.all
    p @peeps
    erb :view
  end

  get '/create' do
    erb :create
  end

  post '/new' do
    Peeps.post(params[:text])
    redirect '/'
  end

  run! if app_file == $0
end
