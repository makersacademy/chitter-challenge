require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/chitter/post_peep' do
    erb(:'/chitter/post_peep')
  end

  post '/chitter/post_peep' do
    Peep.create(text: params[:peep], user: params[:user])
    redirect('/chitter')
  end

end
