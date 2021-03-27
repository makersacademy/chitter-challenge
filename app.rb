require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :chitter
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    redirect '/'
  end

  post '/peeps' do
    Peep.add(params[:new_peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/add_peep' do
    erb :add_peep
  end
 end
