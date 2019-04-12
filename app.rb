require 'sinatra/base'
require_relative './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  get '/peeps' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = params[:peep]
    erb :'peeps/index'
  end


end
