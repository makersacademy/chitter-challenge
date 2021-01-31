require 'sinatra/base'
require './lib/peep'

class PeepManager < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/peeps/new' do
    erb :'peeps_new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do

    erb :'users_new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/peeps'
  end

  run! if app_file == $0

end
