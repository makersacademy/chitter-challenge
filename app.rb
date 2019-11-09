require 'sinatra/base'
require './lib/peeps'
require 'pg'

class Chitter_Challenge < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    "Welcome to Chitter!!"
  end

  get '/peeps' do
    @peeps = Peeps.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peeps.create(comment: params["comment"])
    redirect '/peeps'
  end

end
