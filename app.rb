require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions
  
  get '/' do
    erb(:index)
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

end
