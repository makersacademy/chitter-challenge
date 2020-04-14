require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:content], time: Time.now)
    "Peep created"
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.add_user(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    redirect '/'
  end

end
