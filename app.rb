require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @peeps = Peep.all.reverse
    erb :home
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(params)
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end
  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    flash[:sign_up] = "You're almost ready to Chitter now, just sign in!" if User.create(name: params[:name], email: params[:email], username: params[username], password: params[:password])
    redirect '/sign-in'
  end

  run! if app_file == $0
end
