require 'sinatra/base'

require './lib/Chitter'
require './lib/User'
require './database_connection_setup'

class ChitterServer < Sinatra::Base

  get '/' do
    erb :signup
  end

  post '/signup' do
    email = params[:email]
    password = params[:password]
    name = params[:name]
    username = params[:username]
    User.create(email, password, name, username)
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Chitter.all.reverse
    @users = User.all.first
    erb :chitter
  end

  post '/posting_peeps' do
    peep = params[:post_peep]
    Chitter.post(peep)
    redirect '/chitter'
  end

  run! if app_file == $0
end
