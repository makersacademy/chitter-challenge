require 'sinatra/base'
require_relative './model/peep'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter/home' do
    @peeps = Peep.all
    erb(:index)
  end

  post'/chitter/peep' do
    Peep.create(peep: params[:newpeep])
    redirect '/chitter/home'
  end

end
