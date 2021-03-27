require 'sinatra/base'
require './lib/peep'
require './lib/user'

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
    User.add(params[:name], params[:username], params[:email], params[:password])
    $username = params[:username]
    redirect '/peeps'
  end

  post '/add_peep' do
    Peep.add(params[:new_peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @username = $username
    erb :peeps
  end

  get '/add_peep' do
    erb :add_peep
  end
 end
