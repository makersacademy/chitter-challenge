require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'


class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    p @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: params[:text], user_name: params[:user_name], handle: params[:handle])
    redirect '/'
  end
end
