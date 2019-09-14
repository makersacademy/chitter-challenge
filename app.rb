require 'pg'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session[:peep]
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    session[:peep] = params['peep']
    redirect '/peeps'
  end
end
