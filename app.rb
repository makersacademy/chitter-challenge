require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.add(peep: params[:peep])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end

end
