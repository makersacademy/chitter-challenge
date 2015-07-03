require 'sinatra'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :'users/sign_up'
  end

  post '/users/new' do
    @username = params[:username]
    erb :'users/new'
  end

  post '/users' do
    @username = params[:username]
    erb :'users/peeps'
  end

  get '/users' do
    erb :'users/peeps'
  end

end
