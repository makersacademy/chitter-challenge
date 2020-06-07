require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup.rb'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/'
  end

  get '/signup' do
   erb :signup
 end

 post '/signup' do
   User.add_user(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
   redirect '/'
 end

end
