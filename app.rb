require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peep' do
    session[:peep] = params[:add_peep]
    redirect '/peeps'
  end

  get '/peeps' do
    session[:peep]
  end

  run! if app_file == $0
end
