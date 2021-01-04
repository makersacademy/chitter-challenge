require 'sinatra/base'
require 'pg'
require_relative './lib/chitter'
require_relative './lib/users'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :home
  end

  get '/new' do
    erb :new
  end

  post '/' do
    Peep.add(id: params[:id], body: params[:body])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/newusers' do
    User.newuser(id: params[:id], name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    redirect '/'
  end

end
