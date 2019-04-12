require 'sinatra/base'
require_relative './database_connection_setup'
require 'sinatra/flash'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peeps.create(message: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end


end
