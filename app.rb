require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect 'register_peep'
  end

  post '/register_peep' do
    @chitter = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb (:"peeps/new")
  end

  post '/register_peep' do
    Peep.create(peep: params[:peep])
    redirect '/register_peep'
  end

  # post '/bookmarks/new' do
  #   Peep.create(peep: params[:peep], user: params[:user])
  #   redirect '/register_peep'
  # end
  #
end
