require 'sinatra/base'
require './lib/db_connection'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  before do
    DbConnection.check_env
  end

  get '/' do
    erb :index
  end

  post '/:user_id/peep' do
    Peep.new_peep(params[:message], params[:user_id])
    redirect '/:user_id'
  end

  get '/:user_id' do
    erb :chitter
  end

  get '/signup/new' do
    erb :signup
  end

  post '/new_user' do
    User.new_user(params[:username], params[:password], params[:email])
    redirect '/'
  end

  run! if app_file == $0
end
