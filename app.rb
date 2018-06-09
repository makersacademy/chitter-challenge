require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    Peep.save(peep: params[:peep])
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/confirm' do
    @user = params[:username]
    User.save(username: params[:username], email: params[:email], password: params[:password])
    erb(:confirm)
  end

  run! if app_file == $0

end
