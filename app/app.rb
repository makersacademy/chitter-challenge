require 'sinatra/base'
require_relative '../lib/peep'

class App < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/new' do
    Peep.create(username: params[:username], body: params[:body])
    redirect '/'
  end

end
