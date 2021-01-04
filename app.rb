require 'sinatra/base'
require 'pg'
require_relative './lib/chitter'

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

end
