require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peep = session[:peep]
    @peep = Peep.create(@peep)
    erb :'chitter/index'
  end

  get '/chitter/peep/new' do
    erb :'chitter/peep/new'
  end

  post '/chitter' do
    session[:peep] = params[:peep]
    redirect to '/chitter'
  end

end
