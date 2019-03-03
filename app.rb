require 'sinatra/base'
require_relative './lib/database_connection'
require_relative './lib/peep'
require_relative './database_connection_setup'
require 'date'

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
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(text: params['text'], posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))
    redirect '/peeps'
  end

 run! if app_file == $0
end
