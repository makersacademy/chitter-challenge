require 'sinatra/base'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    session[:peep_text] = ''
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps/add_peep' do
    session[:peep_text] = params[:new_peep_text]
    redirect '/peeps'
  end

  run! if app_file == $0

end
