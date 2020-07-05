require 'sinatra/base'
require 'pg'
require './lib/peeps'
require './lib/dbwrapper'

class ChitterApp < Sinatra::Base

  #enable :sessions

  get '/' do
    erb :index
  end
  
  get '/add' do
    erb :add_form
  end

  post '/add_submit' do
    Peeps.create(params[:message])
    redirect '/'
  end

  get '/list' do
    @list = Peeps.all
    p @list
    erb :list
  end

end