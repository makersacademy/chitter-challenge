require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  register Sinatra::Reloader

  run! if app_file == $0

  get '/' do 
    redirect './index'
  end

  get '/index' do
    p @peeps = Peep.all
    erb :'index'
  end

  post '/index' do
    Peep.create(params[:display_name], params[:peep])
    redirect './index'
  end

  get '/new' do
    erb :'new'
  end

end