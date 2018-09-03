require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions 

  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @peep = Peep.all
    @username = session[:username]
    erb :feed
  end

  post '/new' do
    Peep.add(params[:peep])
    redirect '/feed'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/feed'
  end

  run! if app_file == $0
end
