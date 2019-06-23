require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(username: params[:username], text: params[:text])
    redirect '/peeps'
  end

  
  run! if app_file == $0
end