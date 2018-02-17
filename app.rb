require "sinatra/base"
require "./lib/databaseconnection_setup"

class Chitter < Sinatra::Base

  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    erb(:index)
  end

end
