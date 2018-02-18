require 'sinatra/base'
require './lib/peep'
require 'pg'
require './database_connection_setup'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/post' do
    erb :post
  end

  post '/create-new-link' do
  Peep.create(params[:post])
  redirect '/'
end

end
