require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peep = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    p params
    session[:peep] = params[:text]
    redirect '/peeps'
  end

  run! if app_file == $0
end
