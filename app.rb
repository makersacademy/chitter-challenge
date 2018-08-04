require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/username' do
    session[:username] = params[:username]
    redirect '/feed'
  end

  get '/feed' do
    @username = session[:username]
    @peeps = Peep.all
    erb :feed
  end

  post '/feed' do
    Peep.create(params[:peep])
    redirect '/feed'
  end
end
