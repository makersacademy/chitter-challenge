require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps/new' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.view
    erb :peeps
  end
end
