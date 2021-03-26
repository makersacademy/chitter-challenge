require 'sinatra/base'
require 'pg'
require_relative 'lib/peeps'
require_relative 'db_connection_helper'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  post '/login' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/'
  end

  post '/peep' do
    Peeps.post_peep(params[:peep_text])
    redirect '/'
  end

  run! if app_file == $0

end
