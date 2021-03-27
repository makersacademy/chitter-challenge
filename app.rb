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

  post '/peeps' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
 end
