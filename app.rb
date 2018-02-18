require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  DatabaseConnection.setup("chitter")

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post-peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :"new-user"
  end

  post "/users" do
    # create user
    redirect '/'
  end

end
