require 'sinatra/base'
require './lib/peep'
require './lib/account'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/chitter' do
    @username = session[:account].handle
    @peeps = Peep.all
    erb :chitter
  end

  post '/chitter/sign_up' do
    Account.add(params[:username])
    session[:account] = Account.by_handle(params[:username])
    redirect '/chitter'
  end

  post '/chitter/add' do
    Peep.add(params[:message], session[:account].id)
    redirect '/chitter'
  end


end
