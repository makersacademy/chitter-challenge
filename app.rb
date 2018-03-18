require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/' do
    erb :index
  end

  post '/sign_in' do
    User.create
    @username = params['username']
    redirect '/'
  end

  get '/sign_in' do
    erb :index
  end

  post '/post_peep' do
    Peep.post_peep(params['text'])
    redirect '/'
  end
  run! if app_file == $0

end
